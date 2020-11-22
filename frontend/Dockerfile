FROM python:3.7

COPY . . 

RUN pip3 install flask pymysql flask-sqlalchemy pytest

RUN pip3 install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python3", "app.py"]
