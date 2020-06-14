pipeline {
   agent any

   stages {
      stage('Build: Terraform init') {
        environment {
            AWS_ACCESS_KEY_ID     = credentials ('AWS_ACCESS_KEY_ID')
            AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        }
         steps {
            echo 'Initialising terraform'
	    sh '''
	    cd /tmp/
	    terraform init
	    '''
         }
      }
      stage('Build: Terraform Apply') {
        environment {
            AWS_ACCESS_KEY_ID     = credentials ('AWS_ACCESS_KEY_ID')
            AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        }
         steps {
            echo 'Provisioning app and proxy nodes using AMI built by Packer'
	    sh '''
	    pwd
	    cd /tmp/
	    terraform apply -auto-approve
	    '''
         }
      }
     
   }
}

Works so far!