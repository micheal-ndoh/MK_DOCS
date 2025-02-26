FROM python:3.9-alpine AS builder
WORKDIR /docs

RUN pip install --no-cache-dir mkdocs mkdocs-material

RUN apk add --no-cache nginx

COPY . .

RUN mkdocs build

FROM scratch
COPY --from=builder /docs/site /usr/share/nginx/html
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

COPY --from=builder /usr/sbin/nginx /usr/sbin/nginx
COPY --from=builder /etc/nginx /etc/nginx

EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]