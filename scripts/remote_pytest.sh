#!/bin/bash
ssh -i /home/jenkins/.ssh/id_rsa ubuntu@52.50.198.229 << EOF

sudo rm -r flaskAppProject

git clone https://github.com/Scottynic112/flaskAppProject.git

cd flaskAppProject/

docker-compose up -d --build

docker exec backend bash -c "pytest tests/ --cov application" >> backend_test.txt
docker exec frontend bash -c "pytest tests/ --cov application" >> frontend_test.txt

docker-compose down

EOF