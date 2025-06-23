# MLflow Local Setup

## Overview
This repository provides a fully functional stack for managing and tracking machine learning experiments locally. The stack includes:

- **MLflow Tracking Server**: For logging and managing ML experiments.
- **Local Artifact Store**: Stores experiment artifacts locally.
- **MySQL Backend Store**: Tracks metadata and experiment logs.
- **phpMyAdmin**: A web interface to manage the MySQL database.

---

## Prerequisites
- **Docker** and **Docker Compose** installed on your system.
- A `.env` file to manage credentials securely.

---

## Setup Instructions

### 1. Clone the Repository
Clone the repository to your local machine:
```bash
git clone <repository_url>
cd mlflow-local
```

### 2. Create a `.env` File
Define environment variables for sensitive credentials in a .env file:

```dotenv
# .env file example
MYSQL_ROOT_PASSWORD=<mysql_root_password>
MYSQL_USER=<mysql_user>
MYSQL_PASSWORD=<mysql_password>
MYSQL_DATABASE=<db_name>
MLFLOW_TRACKING_URI=mysql+pymysql://<mysql_user>:<mysql_password>@mysql:3306/<db_name>
PMA_HOST=mysql
PMA_USER=<pma_user>
PMA_PASSWORD=<pma_password>
```

P.S.: In a real-world scenario you would use Docker secrets or a secrets management service


### 3. Build the Custom MLFlow Docker Image

This repository includes a `Dockerfile` to build a custom MLFlow image with the necessary dependencies (i.e. `pymysql` package that is needed to connect to MySQL DB)

Build the image:
```bash
docker build -t custom-mlflow:python3.12 .
```

### 4. Start the stack

Run the services using Docker Compose:

- Attach Mode (for debugging):
  ```bash
  docker compose up
  ```
- Detach Mode (run in the background):
  ```bash
  docker compose up -d
  ```

### 5. Access the Services

- MLFlow UI: http://localhost:5000
- phpMyAdmin: http://localhost:8080

## Notes

- This setup is designed for local use. For production, consider using Docker Secrets or a secrets management services to handle credentials securely. Additionaly you may want to use storage services like S3, and remote SQL servers.
- The MLFlow tracking server uses MySQL as the backend store and a local folder for artifacts. Update the `docker-compose.yml` file as needed for your environment.

---

### Licence
This repository is licensed under the MIT License. See LICENSE for details.


