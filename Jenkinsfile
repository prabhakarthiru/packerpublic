pipeline {
	agent any

  environment {
        cre = 'sh assumerole.env'
  }
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