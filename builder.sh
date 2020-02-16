#!/usr/bin/env bash

ABS_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $ABS_PATH

if [[ `vagrant global-status --prune | grep devops | grep running | wc -l` -lt 1 ]]; then
    cat <<END
    ################################################################################
    A vcp_builder is not running yet. This may take a few minutes to
    bring up if it has not been created yet.
    ################################################################################
    ...
END

    cd $ABS_PATH/vagrant/machines/builder
    vagrant up
fi

cat <<END
################################################################################
Attempting to log into the machine now.
NOTE(s):
your host machine.
- postres permissions have been setup to allow remote connections into this
machine (192.168.56.200) from 192.168.56.0/24
################################################################################
...
END
cd $ABS_PATH/vagrant/machines/builder
vagrant ssh
vagrant suspend
