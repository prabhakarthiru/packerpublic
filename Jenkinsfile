pipeline {
	agent any

      options {
       timestamps()
       timeout(time: 1, unit: 'HOURS')
       disableConcurrentBuilds ()
       }

  environment {
    BUILD_VPC_ID = 'vpc-9c99a2f9'
    BUILD_SUBNET_ID = 'subnet-e969b68d'
    BUILD_SG_ID = 'sg-00493b2e885b258ae'
    BUILD_PROFILE = 'ec2switchrole'
    AWS_REGION = 'ap-southeast-2'
    source_artefact_bucket= 'cicdbucket-thirup'

  }
	       stages {
                   stage('Validate packer template'){
                               steps {

                                     echo "Validating Packer template"
                                     sh 'sh packer.sh validate'
                                      
                               }
                   }

                   stage('PackerAMI') {
                                steps {
                                    echo "Baking AMI in-Progress"
                                     sh 'sh packer.sh build'
                                     echo "Baking AMI Success"
                                }
                   }
                   
                   }


	       }