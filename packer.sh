# packer script


TASK=$1

  case $TASK in
	validate)
		echo "Starting Packer validate"
        packer validate $PACKER_INPUT_JSON
		;;
	build)
		echo "starting packer build"
        packer build $PACKER_INPUT_JSON
		break
		;;
	*)
		echo "Packer defined to execute only validate, build"
        echo "Skipping packer since the input didn't match with requirement"
		;;
  esac
