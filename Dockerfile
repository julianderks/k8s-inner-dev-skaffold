# Dockerfile

FROM python:3.9-slim

WORKDIR /app
COPY src/ /app

RUN pip install flask redis

CMD ["python", "app.py"]
