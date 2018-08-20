#!/usr/bin/env bash
#
# TRAVIS_OS_NAME specific install preperation script hook;
# validate the TRAVIS_SETUP_DIR, TRAVIS_OS_NAME, and OS_TYPE
# and build the setup file from there ...
#

source "$(dirname $0)/shlib/global"
source "$(dirname $0)/shlib/sanity"
source "$(dirname $0)/shlib/config"
source "$(dirname $0)/shlib/hostos"

#==========================================================#

hostos "validate"
hostos "before_install"
