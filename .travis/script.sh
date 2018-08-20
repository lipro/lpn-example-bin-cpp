#!/usr/bin/env bash
#
# TRAVIS_BUILD_TOOL specific build script hook; validate and
# run over TRAVIS_BUILD_ACTIONS ...
#

source "$(dirname $0)/shlib/global"
source "$(dirname $0)/shlib/sanity"
source "$(dirname $0)/shlib/config"
source "$(dirname $0)/shlib/build"

#==========================================================#

build "validate"
build "action"
