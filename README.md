# Backend Proxy Server

This is a simple reverse proxy server using NGINX and Docker.

## Project Structure

```
/
├── .gitignore
├── Dockerfile
├── html/
│   └── index.html
└── nginx/
    └── default.conf
```

## Usage

1.  **Build the Docker image:**
    ```bash
    docker build -t backend-proxy-server .
    ```

2.  **Run the Docker container:**
    ```bash
    docker run -d -p 80:80 backend-proxy-server
    ```

Now you can access the reverse proxy server at `http://localhost`.
