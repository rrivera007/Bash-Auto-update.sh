#!/bin/bash
# @Author: soggyslapper
# @Date:   2021-05-23 18:15:36
# @Last Modified by:   soggyslapper
# @Last Modified time: 2021-05-23 20:00:06
#
#	Auto-update
#	===========
#	This is a short program that checks to 
#	see if any of your programs are out of date
#	and updates them if they are


# Internal Variables (user should not change), NC = no color
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
NC="$(tput sgr0)"
DEPENDENCIES=" "


#If anything needs to be updated i.e. dependencies then it does so
	function main()
	{	

		Verify_Root

		echo "$0:${GREEN} Setting Up... ${NC}"

		performingTask

		install_dependencies

		exit 0
	}


#lets user know that the script is currently running
	function performingTask()
	{
		echo "${FUNCNAME}:${GREEN} Running Tasks... ${NC}"
	}

#In case an error occurs, it aborts the script
	function ErrorHandler()
	{
		echo "${FUNCNAME}:${RED} Error Occured... Aborting Script ${NC}"
		exit -1
	}

#installs dependencies if needed
	function install_dependencies()
	{
		echo "$0:${GREEN} Installing Dependencies Please wait... ${NC}"

		ErrorHandler=ErrorHandler

		sudo apt-get update && apt-get -y install $DEPENDENCIES || ErrorHandler
	}

#checks to make sure you are running script as root
	function Verify_Root()
	{
		if [ "$UID" != "0" ]; then
			echo "$0:${RED} you must be root to run this script :( ${NC}"
			exit -1
		fi
	}

#Main function that runs script
	main $0