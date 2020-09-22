#!/bin/bash

print_usage() {
    echo "$0 32|64"
    exit 1
}

get_cpu_number() {
    cat /proc/cpuinfo | grep processor | wc -l
}

case $1 in
    32)
        export EXTRAVERSION=-504.el6.i686
        cp ./config.mic3329 .config
        ;;
    64)
        export EXTRAVERSION=-504.el6.x86_64
        cp ./config.mic3329_64 .config
        ;;
    *)
        print_usage
        ;;
esac

make -j $(get_cpu_number)
