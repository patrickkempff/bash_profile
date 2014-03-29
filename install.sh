#!/usr/bin/env bash

# ---------------------------------------------------------------------------
# Author: Patrick Kempff <patrickkempff@gmail.com>
# Date: 29 March 2014

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Usage: ./install.sh

# ---------------------------------------------------------------------------

timestamp=`/bin/date +s%s`

target_file="$HOME/.bash_profile"
backup_file="${target_file}.pk.bck-saved-${timestamp}"

test_file="$HOME/test.test"

# Print a message to the console.
log() { printf "$*\n" ; return $? ; }

# Print an error message to the console and bail out of the script.
fail() { log "\nERROR: $*\n" ; exit 1 ; }

welcome() {
	echo "Hello! I am going to install your new bash profile."
	
	sleep 3

	echo ""
}

backup() {
	if [ -f "${target_file}" ]
	then 
		echo "To be sure I am are going to make a backup.."
		cp ${target_file} ${backup_file} || fail "I could not backup of file ${target_file}. Please make sure that I can write to this directory!"
		echo "The backup location is: ${backup_file}"
		
		sleep 3

		echo ""
	else 
		fail "${target_file} does not exists."
	fi
}

download() {
	curl -o ${test_file} https://raw.githubusercontent.com/websdesign/bash_profile/master/bash_profile || fail "Could not download bash_profile"
	sleep 3

	echo ""
	echo "We are done. In order for the changes to take effect, please restart the Terminal."
	echo "Have a nice day!"
	echo ""

	sleep 3
}


welcome
backup
download
