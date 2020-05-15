# api

config proto that models what this modules uses.

types of config:
- immutable configs: e.g server URL 
- mutable config: e.g darkmode

- Premise: maintemplate config.proto inherits the modules config.proto

- gen it.
- it immutable
	- always will repo service get ALL data from assets
- if mutable:
	- if mock is True:
		- repo service get ALL data from assets
	- if mock is false:
		- repo service gets all data from server.
