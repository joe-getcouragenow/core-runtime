package main

import (
	"bytes"
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	git "github.com/go-git/go-git/v5"
	"github.com/go-git/go-git/v5/plumbing"
	"github.com/gookit/color"
	"io"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"strings"
)

var (
	colorRed    = color.FgRed.Render
	colorYellow = color.FgYellow.Render
	colorGreen  = color.FgGreen.Render
	colorCyan   = color.FgCyan.Render
	fileFlag    string // version.json
	outFlag     string // binary output directory
	cloneDir    string // temp clone dir
	originURL   string // current git url
)

func gitClone(url, dir string) (*git.Repository, error) {
	log.Printf("Cloning: %s to %s", colorCyan(url), colorYellow(dir))
	r, err := git.PlainClone(dir, false, &git.CloneOptions{
		URL:               url,
		RecurseSubmodules: git.DefaultSubmoduleRecursionDepth,
	})
	if err != nil {
		if err == git.ErrRepositoryAlreadyExists {
			r, err = git.PlainOpen(dir)
			if err != nil {
				return nil, err
			}
		} else {
			return nil, err
		}
	}
	rev, err := r.Head()
	if err != nil {
		return nil, err
	}
	log.Printf("Successfully cloned: %s, sha: %s\n",
		url, colorGreen(rev.Hash()))
	return r, nil
}

func gitCheckout(r *git.Repository, commit string) error {
	log.Printf("Checkout: %s\n", colorYellow(commit))
	hash := plumbing.NewHash(commit)
	w, err := r.Worktree()
	if err != nil {
		return err
	}
	return w.Checkout(&git.CheckoutOptions{
		Hash: hash,
	})
}

func exists(path string) (bool, error) {
	_, err := os.Stat(path)
	if err == nil {
		return true, nil
	}
	if os.IsNotExist(err) {
		return false, nil
	}
	return true, err
}

func checkAndMakeDir(path string) error {
	ex, err := exists(path)
	if err != nil {
		return err
	}
	if !ex {
		if err := os.MkdirAll(path, 0755); err != nil {
			return err
		}
	}
	return nil
}

// gitRemoteInfo returns sha for current dir (core-runtime)
// and its branch
func gitRemoteInfo(dir string) (*string, error) {
	r, err := git.PlainOpen(dir)
	if err != nil {
		return nil, err
	}
	rev, err := r.Head()
	if err != nil {
		return nil, err
	}
	sha := rev.Hash().String()
	return &sha, nil
}

type tool struct {
	Name     string    `json:"name"`
	Versions []version `json:"versions"`
}

type version struct {
	Name string `json:"name"`
	Sha  string `json:"sha"`
}

func runUnixCmd(displayOutput bool, cmdName string, flags ...string) (*string, error) {
	cmd := exec.Command(cmdName, flags...)
	var stdoutBuf, stderrBuf bytes.Buffer

	if displayOutput {
		cmd.Stdout = io.MultiWriter(os.Stdout, &stdoutBuf)
		cmd.Stderr = io.MultiWriter(os.Stderr, &stderrBuf)
	} else {
		cmd.Stdout = &stdoutBuf
		cmd.Stderr = &stderrBuf
	}
	// we will ignore error from cmd run
	// and only assign error when it is from stderr
	cmd.Run()
	buf := strings.TrimSpace(string(stdoutBuf.Bytes()))
	err := strings.TrimSpace(string(stderrBuf.Bytes()))
	if err != "" {
		return nil, errors.New(err)
	}
	return &buf, nil
}

func main() {
	flag.StringVar(&fileFlag, "f", "", `version.json file to parse and build`)
	flag.StringVar(&outFlag, "o", "", `output binary`)
	flag.StringVar(&cloneDir, "c", "", `temp clone dirs`)
	flag.StringVar(&originURL, "g", "https://github.com/getcouragenow/core-runtime", `current git remote origin`)
	flag.Parse()
	if fileFlag == "" {
		log.Fatal(colorRed("no version.json file supplied"))
	}
	if cloneDir == "" {
		log.Fatal(colorRed("cannot get build / clone directory"))
	}
	curDir, err := os.Getwd()
	if err != nil {
		log.Fatalf("unable to get current directory: %v\n", colorRed(err))
	}
	if outFlag == "" {
		log.Println(colorCyan("no output dir supplied, defaults to current directory"))
		outFlag = curDir
	}
	if err = checkAndMakeDir(cloneDir); err != nil {
		log.Fatalf("cannot create clone directory %s => %v\n", cloneDir, colorRed(err))
	}
	if outFlag != curDir {
		if err = checkAndMakeDir(outFlag); err != nil {
			log.Fatalf("cannot create directory %s => %v\n", outFlag, colorRed(err))
		}
	}
	curSha, err := gitRemoteInfo(curDir)
	if err != nil {
		log.Fatalf("cannot get current git dir sha: %v", colorRed(err))
	}
	var t tool
	b, err := ioutil.ReadFile(fileFlag)
	if err != nil {
		log.Fatalf("unable to read %s => %v\n", fileFlag, colorRed(err))
	}
	if err = json.Unmarshal(b, &t); err != nil {
		log.Fatalf("unable to marshal %s to struct: %v", fileFlag, colorRed(err))
	}
	for _, v := range t.Versions {
		log.Printf("building %s\n", t.Name)
		clDir := fmt.Sprintf("%s/%s", cloneDir, t.Name)
		if err = checkAndMakeDir(clDir); err != nil {
			log.Fatalf("cannot create clone directory %s => %v\n", clDir, colorRed(err))
		}
		repo, e := gitClone(originURL, clDir)
		if e != nil {
			log.Fatalf("Cannot clone directory")
		}
		if err = gitCheckout(repo, v.Sha); err != nil {
			log.Fatalf("cannot checkout to %s: %v\n", colorGreen(v.Sha), colorRed(err))
		}
		toolDir := fmt.Sprintf("%s/%s/%s", clDir, "tool", t.Name)
		binName := fmt.Sprintf("%s/%s-%s-%s", outFlag, t.Name, *curSha, v.Name)
		runUnixCmd(false, `go`, `build`, `-o`, binName, `-v`, toolDir)
	}
	if _, err = runUnixCmd(true, `rm`, `-rf`, cloneDir); err != nil {
		log.Fatalf("cannot remove clone directory %s: %v", cloneDir, colorRed(err))
	}
}
