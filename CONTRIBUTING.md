# 개발 가이드

[← README로 돌아가기](README.md)

## 사전 요구사항

- Docker

## 로컬 실행

1. 리포지토리 클론

2. Docker 이미지 빌드
   ```bash
   docker build -t backend-proxy-server .
   ```

3. 컨테이너 실행
   ```bash
   docker run -d -p 80:80 backend-proxy-server
   ```

`http://localhost`에서 확인할 수 있습니다.

---

## NGINX 설정

설정 파일은 `nginx/conf.d/` 아래에 서비스별로 분리되어 있습니다.

| 파일 | 설명 |
|---|---|
| `www.conf` | `www.montyoh.dev` 라우팅 설정 |
| `xcelerate.conf` | `xcelerate.montyoh.dev` 라우팅 설정 |
| `payment.conf` | `payment.montyoh.dev` 라우팅 설정 |
| `vikunja.conf` | `vikunja.montyoh.dev` → `vikunja:3456` 라우팅 설정 |
| `*.conf.disabled` | 비활성화된 설정 |

새 서비스를 추가하려면 `conf.d/` 아래에 `서비스명.conf` 파일을 추가하면 됩니다.

---

## 브랜치 전략

```
origin
  ├── master
  └── feature/
        └── branch-name
```

1. `master` 기준으로 `feature/branch-name` 브랜치 생성
2. 개발 완료 후 `master`로 Pull Request 생성
3. GitHub Actions — Docker 이미지 빌드 성공 확인 후 Merge
