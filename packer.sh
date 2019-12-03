# packer script


TASK=$1

  case $TASK in
	validate)
		echo "Starting Packer validate"
        /usr/local/packer/packer validate packer.json
		;;
	build)
		echo "starting packer build"
        /usr/local/packer/packer build packer.json
		break
		;;
	*)
		echo "Packer defined to execute only validate, build"
        echo "Skipping packer since the input didn't match with requirement"
		;;
  esac
