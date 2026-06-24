<br/>

<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nginx/nginx-original.svg" alt="NGINX" width="72" />

# backend-proxy-server

[![Push](https://github.com/dev-montyoh/backend-proxy-server/actions/workflows/push-master.yml/badge.svg)](https://github.com/dev-montyoh/backend-proxy-server/actions/workflows/push-master.yml)

**NGINX + Docker 기반 리버스 프록시 서버**

---

개인 서버(OCI)에서 실행 중인 여러 서비스로 트래픽을 라우팅하는 리버스 프록시입니다. 도메인·서브도메인별로 NGINX 설정 파일을 분리하여 관리하며, GitHub Actions로 master 브랜치 push 시 OCI 인스턴스에 자동 배포됩니다.

---

## 사용 기술

- NGINX
- Docker
- GitHub Actions

---

## 주요 특징

- **리버스 프록시** — 도메인·경로별로 백엔드 컨테이너에 트래픽 라우팅
- **설정 분리** — 서비스별 `conf.d/*.conf`로 독립 관리
- **CI/CD 자동화** — master push → OCI 인스턴스에 SSH 배포

---

## 라우팅 구성

| 도메인 | 라우팅 대상 |
|---|---|
| `www.montyoh.dev` | `frontend-portfolio:80` (포트폴리오) |
| `www.montyoh.dev/api` | `backend-api-server-gateway:80` (API) |
| `xcelerate.montyoh.dev` | `xcelerate-demo:8080` |
| `vikunja.montyoh.dev` | `vikunja:3456` (프로젝트 관리) |
| `affine.montyoh.dev` | `affine:3010` (AFFiNE 워크스페이스) |

---

## CI/CD

- **PR → master**: Docker 이미지 빌드 검증
- **push → master**: OCI 인스턴스에 SSH 접속 후 최신 이미지 pull 및 서비스 재시작

---

## 문서

- **[개발 가이드 →](CONTRIBUTING.md)** — 로컬 실행 · 설정 방법
