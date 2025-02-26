FROM python:3.9-alpine AS builder
WORKDIR /docs

RUN apk add --no-cache nginx && \
    pip install --no-cache-dir mkdocs mkdocs-material

COPY . .
RUN mkdocs build

FROM nginx:alpine

COPY --from=builder /docs/site /usr/share/nginx/html
COPY --from=builder /etc/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
