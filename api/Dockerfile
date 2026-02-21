FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN apt update && apt upgrade -y && apt install netcat-openbsd -y

RUN pip install -r requirements.txt --no-cache-dir

COPY . .