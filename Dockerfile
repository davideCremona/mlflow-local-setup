FROM python:3.12-slim

# Install system dependencies required for MLFlow and MySQL client
RUN apt-get update && apt-get install -y \
	build-essential \
	libmariadb-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Install MLFlow and additional Python dependencies
RUN pip install --no-cache-dir mlflow pymysql cryptography

# Set up MLFlow working directory
WORKDIR /mlflow

# Expose the default MLFlow tracking server port
EXPOSE 5000

# Default command for the MLFlow tracking server
CMD ["mlflow", "server"]
