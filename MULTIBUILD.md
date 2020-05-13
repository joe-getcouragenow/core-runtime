## Monorepo Multiversion Tool build Proof of Concept

Basically works like this:

- In each `tool`, you should find manifest-like json called `versions.json`

- The file contains something like this:
```
{
  "name": "dummy", ==> the name of the tool
  "versions": [ ==> versions of the tool
    {
      "name": "v1", ==> version name
      "sha": "6e779f42af9ff174b44f0bbaa29a02753646b629" ==> commit hash / sha
    },
    {
      "name": "v2",
      "sha": "1a68c63a07511ca028d706504b9e632a3a901a13"
    }
  ]
}
```

- On build, the multibuild.go via `make build-dummy` will accept this `versions.json` and
will build them to user specified output directory

- The build outputs / binary names will have this naming format: `toolname-$(CURRENT_RELEASE_SHA)-$(TOOL_VERSION_NAME)`
so for the case of dummy,it will be `dummy-$(CURRENT_RELEASE_SHA)-v1   and dummy-$(CURRENT_RELEASE_SHA)-v2.`

- The same case happens in github workflow, it also calls `make build-dummy`

- Released Github binaries will contain multiple zips each containing different version of the tool.
(albeit for the sake of simplicity of this proof of concept, the 
release draft will only have single zip containing all versions).

- `fish-foods` can then be created / generated according to the releases.