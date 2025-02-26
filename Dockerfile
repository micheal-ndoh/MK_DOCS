FROM python:3.9-alpine AS builder

RUN apk add --no-cache nginx && \
    pip install --no-cache-dir mkdocs mkdocs-material

WORKDIR /docs
COPY . .
RUN mkdocs build && \
    rm -rf /docs/docs /docs/mkdocs.yml

FROM nginx:alpine

COPY --from=builder /docs/site /usr/share/nginx/html
COPY --from=builder /etc/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
