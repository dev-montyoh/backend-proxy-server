# 베이스 이미지
FROM nginx:latest

# 커스텀 HTML 복사
COPY html /usr/share/nginx/html

# conf.d 전체를 통째로 복사
COPY nginx/conf.d/ /etc/nginx/conf.d/

# 포트 노출
EXPOSE 80