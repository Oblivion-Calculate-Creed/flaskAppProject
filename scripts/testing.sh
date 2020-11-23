#ssh -i /home/jenkins/.ssh/id_rsa ubuntu@34.241.146.254 << EOF
sudo rm -r flaskAppProject
git clone https://github.com/Scottynic112/flaskAppProject
cd flaskAppProject

cd database
mysql -h testdb.cx9kvxqzuimo.eu-west-1.rds.amazonaws.com -P 3306 -u root -ppassmaxsecure < Create.sql
mysql -h initialdb.cx9kvxqzuimo.eu-west-1.rds.amazonaws.com -P 3306 -u root -ppassmaxsecure < Create.sql
cd ..
sudo docker-compose up -d
sudo docker exec backend bash -c "pytest tests/ --cov application" 
sudo docker exec frontend bash -c "pytest tests/ --cov application"
sudo docker-compose down
logout
#EOF