FROM python:3.9-alpine AS builder
WORKDIR /docs

RUN pip install --no-cache-dir mkdocs mkdocs-material

COPY . .

RUN mkdocs build

FROM scratch
COPY --from=builder /docs/site /usr/share/nginx/html
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]