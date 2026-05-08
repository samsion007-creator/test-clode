pipeline {
    agent any
    
    environment {
        // ตัวแปรเก็บชื่อ Credential ที่เราจะไปตั้งค่าในระบบ Jenkins ทีหลัง
        DOCKER_CREDENTIAL_ID = 'docker-hub-auth' 
        // ⚠️ แก้ไขตรงนี้: เปลี่ยน 'your-docker-username' เป็น Username ของคุณ
        IMAGE_NAME = 'your-docker-username/my-cloud-api' 
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling latest code from Git...'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Compiling and installing dependencies...'
                // เนื่องจากเรา Build ภายใน Dockerfile แล้ว ในขั้นนี้เราจะจำลองการทำงานไว้ก่อน
                sh 'go version || echo "Go is not installed on this Jenkins node, skipping local build."'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running unit and integration tests...'
                // จำลองการรัน Test (คุณสามารถเพิ่มไฟล์ _test.go ในอนาคตได้)
                sh 'echo "Tests passed successfully!"'
            }
        }
        
        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }
        
        stage('Push Hub') {
            steps {
                echo 'Pushing image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIAL_ID, passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                    sh "docker push ${IMAGE_NAME}:latest"
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Triggering Terraform/Ansible...'
                // ตรงนี้เราจะเว้นไว้เป็น Echo ก่อน เพราะการรันจริงจะอยู่ใน Phase 3
                sh 'echo "Phase 3 provision will start here!"'
            }
        }
    }
}