# Idempotent Ubuntu Setup for 18.04 / amd64

A collection of (mostly) idempotent shell scripts for easy setting up a dev machine for our company, and some extras for fun.
The scripts fullfil our needs, YMMV.
But they are a good starting point to adapt to your needs.

The scripts might install some packages that should already be available, but better safe than sorry.
They are tested with docker, so the base system differs a little from a "real" machine.

NO WARRANTIES GIVEN! IF YOU BRICK YOUR MACHINE THERE'S ONLY YOU TO BLAME!

## Idempotency

All scripts use marker files to check if they already ran, so they should only run again if the previous attempt didn't succeed.
But there's no cleanup step, so you might end up with duplicate stuff, like added ppa.
You can set the location of these files, they will contain the date and the installed version of the successful run.
For some stuff the version will be "current" or "ppa" or something non-specific because we don't know which exact version will be installed.

## How to use it

See `setup-example.sh` for how to use it.
Just add the scripts you want to run.
You can override default settings, see a script for the available/needed environment variables.

## License

MIT. See LICENSE.

