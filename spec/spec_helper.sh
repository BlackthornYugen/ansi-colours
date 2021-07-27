# shellcheck shell=sh

# Defining variables and functions here will affect all specfiles.
# Change shell options inside a function may cause different behavior,
# so it is better to set them here.
# set -eu

# This callback function will be invoked only once before loading specfiles.
spec_helper_precheck() {
  # Available functions: info, warn, error, abort, setenv, unsetenv
  # Available variables: VERSION, SHELL_TYPE, SHELL_VERSION
  : minimum_version "0.29.0"
}

# This callback function will be invoked after a specfile has been loaded.
spec_helper_loaded() {
  :
}

# This callback function will be invoked after core modules has been loaded.
spec_helper_configure() {
  # Available functions: import, before_each, after_each, before_all, after_all
  : import 'support/custom_matcher'
}

# used to prevent zsh & bash from interperating ansi
print_colours_escaped() {
  case "${ZSH_ARGZERO:-$0}" in
  *bash) print_colours "$1" "$2" | sed "s/\x1b/\\\u001b/g" ;;
  *zsh)  print_colours "$1" "$2" | sed "s/\x1b/\\\u001b/g" ;;
  *)     print_colours "$1" "$2" ;;
  esac
}