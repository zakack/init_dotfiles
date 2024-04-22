#!/bin/bash

source ./Scripts/getDistro.sh
machine=$(./Scripts/machine.sh)

if [[ $OS == 'Ubuntu' ]]; then
	sh -c "$(./ubuntuDependencies.sh)"
fi

if [[ $OS != 'Ubuntu' ]]; then
	sh -c "$(./archDependencies.sh)"
fi
