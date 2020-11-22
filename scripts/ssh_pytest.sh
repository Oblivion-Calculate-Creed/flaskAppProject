sudo rm -r flaskAppProject
git clone --branch dev https://github.com/Scottynic112/flaskAppProject.git
cd flaskAppProject
sudo -E DATABASE_URI=${DATABASE_URI} -E TEST_DATABASE_URI=${TEST_DATABASE_URI} -E SECRET_KEY=${SECRET_KEY} docker-compose up -d --build
sudo docker exec frontend bash -c "pytest tests/ --cov application"
sudo docker exec backend bash -c "pytest tests/ --cov application"
sudo docker-compose down
rm -rf flaskAppProject