#!/bin/sh

export ROOT_URL=http://igft.org:10500
export MOBILE_ROOT_URL=http://igft.org:10500
export MOBILE_DDP_URL=http://igft.org:10500
export PACKAGE_DIRS="$PWD/packages"
meteor run ios-device --mobile-server=http://igft.org:10500/
