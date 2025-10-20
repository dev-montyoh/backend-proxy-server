# 베이스 이미지
FROM nginx:latest

# 커스텀 HTML 복사
COPY html /usr/share/nginx/html

# 커스텀 Nginx 설정 복사
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# 포트 노출
EXPOSE 80