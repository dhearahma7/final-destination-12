pipeline {
  agent any

  environment {
    GIT_REPO = "https://github.com/dhearahma7/final-destination-12.git
  }

  stages {
    stage('Clone Repository') {
      steps {
        git url: "${env.GIT_REPO}", branch: 'main'
      }
    }

    stage('Update index.html') {
      steps {
        sh '''
        python3 scripts/update_gallery.py
        '''
      }
    }

    stage('Commit and Push Changes') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'github-token', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASS')]) {
          sh '''
            git config user.name "dhearahma7"
            git config user.email "dheadianti235@gmail.com"

            git add webapp/index.html || true
            git commit -m "CI: Update index.html with new gallery images" || true
            git push https://$GIT_USER:$GIT_PASS@github.com/dhearahma7/final-destination-12.git

          '''
        }
      }
    }


    stage('Deploy (Optional)') {
      steps {
        sh '''
        docker compose down || true
        docker compose up -d --build
        '''
      }
    }
  }
}
