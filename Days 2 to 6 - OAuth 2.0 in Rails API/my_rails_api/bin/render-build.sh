#!/usr/bin/env bash
# exit on error
# "set": Set or unset values of shell options and positional parameters.
# "-o": The option-name can be one of the following without 'no' prefix.
# "errexit": If set, the shell will exit immediately if a simple command exits with a non-zero status, 
#            unless the command that fails is part of an until or while loop, part of an if statement,
#            part of a && or || list, or if the command's return status is being inverted using !.
set -o errexit

# "bundle install": Install the missing gems.
bundle install

# "bundle exec": Execute a command in the context of the bundle.
# "assets:precompile": Compile all the assets named in config.assets.precompile.
bundle exec rails assets:precompile

# "bundle exec": Execute a command in the context of the bundle.
# "assets:clean": Remove old assets.
bundle exec rails assets:clean