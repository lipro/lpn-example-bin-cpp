#!/usr/bin/env bash
#
# TRAVIS_OS_NAME specific install script hook; validate the
# TRAVIS_SETUP_DIR and execute the setup file or assemble a
# build image according to instructions from there and test
# the result ...
#

source "$(dirname $0)/shlib/global"
source "$(dirname $0)/shlib/sanity"
source "$(dirname $0)/shlib/config"
source "$(dirname $0)/shlib/hostos"

#==========================================================#

hostos "validate"
hostos "install"
hostos "runner"
