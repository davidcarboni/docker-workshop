FROM python:alpine

WORKDIR /app
COPY . .

RUN pip install -r requirements.txt
ENV FLASK_APP=app.py

CMD flask run --host=0.0.0.0
