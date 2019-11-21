pipeline {
	agent any

options {
    ansiColor('xterm')
    timestamps()
    timeout(time: 1, unit: 'HOURS'
  }

  environment {
    BUILD_VPC_ID = 'vpc-9c99a2f9'
    BUILD_SUBNET_ID = 'subnet-e969b68d'
    BUILD_SG_ID = 'sg-00493b2e885b258ae'
    BUILD_PROFILE = 'ec2switchrole'
    AWS_REGION = 'ap-southeast-2'
  }
	       stages {
                   stage('Validate Packer'){
                               steps {

                                      echo "Validating Packer template"
                                      packer validate packer.json
                                      
                               }
                   }

                   stage('TWO') {
                                steps {
                                      input ('do you want to proceed')
                                }
                   }
                   stage('PackerAMI'){
                                steps {
                                       sh 'test.sh'
                                }
                   }
                   stage ('three') {
                            when {
							        not {
                                           branch "master"
                                          }
                                  }
                                     steps {

                                           echo "Hello"
                                     }
                                    }
                   }


	       }