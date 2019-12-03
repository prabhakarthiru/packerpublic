# packer script


TASK=$1

  case $TASK in
	validate)
		echo "Starting Packer validate"
        packer validate packer.json
		;;
	build)
		echo "starting packer build"
        packer build packer.json
		break
		;;
	*)
		echo "Packer defined to execute only validate, build"
        echo "Skipping packer since the input didn't match with requirement"
		;;
  esac
