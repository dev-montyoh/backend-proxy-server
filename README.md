# 백엔드 프록시 서버

이 프로젝트는 NGINX와 Docker로 구축된 리버스 프록시 서버입니다. 서버 이름에 따라 트래픽을 다른 백엔드 서비스로 라우팅하도록 설계되었습니다.

## 주요 기능

- **리버스 프록시**: 들어오는 트래픽을 적절한 백엔드 서비스로 라우팅합니다.
- **Docker 기반**: Docker를 사용하여 쉽게 배포하고 확장할 수 있습니다.
- **CI/CD**: GitHub Actions를 사용하여 빌드 및 배포를 자동화합니다.
- **사용자 정의**: `nginx/default.conf` 파일을 통해 쉽게 구성할 수 있습니다.

## 프로젝트 구조

```
/
├── .github/
│   └── workflows/
│       ├── pull-request-master.yml  # 풀 리퀘스트를 위한 GitHub Action
│       └── push-master.yml          # master 브랜치에 푸시를 위한 GitHub Action
├── .gitignore
├── Dockerfile
├── html/
│   └── index.html                   # 기본 HTML 페이지
└── nginx/
    └── default.conf                 # NGINX 설정 파일
```

## 시작하기

### 사전 요구 사항

- [Docker](https://docs.docker.com/get-docker/)

### 설치

1.  **리포지토리 클론:**
    ```bash
    git clone https://github.com/your-username/backend-proxy-server.git
    cd backend-proxy-server
    ```

2.  **Docker 이미지 빌드:**
    ```bash
    docker build -t backend-proxy-server .
    ```

## 사용법

1.  **Docker 컨테이너 실행:**
    ```bash
    docker run -d -p 80:80 backend-proxy-server
    ```

이제 `http://localhost`에서 리버스 프록시 서버에 액세스할 수 있습니다. 기본적으로 "사이트 준비 중" 페이지가 표시됩니다.

## 배포

이 프로젝트는 CI/CD를 위해 GitHub Actions를 사용합니다. 워크플로는 `.github/workflows` 디렉토리에 정의되어 있습니다.

- **`pull-request-master.yml`**: 이 워크플로는 `master` 브랜치에 대한 풀 리퀘스트 시 트리거됩니다. Docker 이미지를 빌드하여 GitHub 컨테이너 레지스트리에 푸시합니다.
- **`push-master.yml`**: 이 워크플로는 `master` 브랜치에 푸시될 때 트리거됩니다. SSH를 통해 EC2 인스턴스에 연결하고 최신 Docker 이미지를 가져와 `backend-proxy-server` 서비스를 다시 시작합니다.

## 설정

NGINX 설정은 `nginx/default.conf` 파일에서 수정할 수 있습니다.

현재 설정은 `www.dev-monty.me` 서버 이름에 대한 정적 HTML 파일을 제공합니다. 리버스 프록시로 사용하려면 `location` 블록을 다음과 같이 수정할 수 있습니다.

```nginx
server {
    listen 80;
    server_name www.dev-monty.me;

    location / {
        proxy_pass http://your-backend-service:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```
