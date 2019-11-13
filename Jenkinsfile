pipeline {
	agent any
	       stages {
                   stage('one'){
                               steps {

                                      echo 'Hi, My first pipeline'
                               }
                   }

                   stage('TWO') {
                                steps {
                                      input ('do you want to proceed')
                                }
                   }
                   stage('PackerAMI'){
                                steps {
                                      sh 'packer build template.json'
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