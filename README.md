# core-runtime

Core runtime code used by all Projects.

Contains:
- Design time tools ( e.g lang tools)
- Boilerplate to match the Design time and Compile time tools ( e.g flu.mk)
- Runtime code ( e.g sys-core/lang flutter and golang code)

## Examples

See the core-examples repo to see this exercised.

## CI

The CI builds and runs any tests needed.

It must run off git tags, and do github binary releases of the tools ( tools and boilerplates )
Flutter and golang projects can import import using the git tags.

So the Packages flutter and golang code will need to use the git tags for importing !
