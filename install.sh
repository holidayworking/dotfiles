#!/bin/sh

set -ex

bin/setup

# Homebrew does not allow sudo.
case "$(uname)" in
  "Darwin")  bin/mitamae local "$@" lib/recipe.rb ;;
  *) sudo -E bin/mitamae local "$@" --log-level=debug lib/recipe.rb ;;
esac
