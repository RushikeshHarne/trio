FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install mysql-connector-python psycopg2-binary python-dateutil prettytable

CMD ["python", "main.py"]
