FROM python:3.9 AS builder
WORKDIR /docs

RUN pip install --no-cache-dir mkdocs mkdocs-material

COPY . .

RUN mkdocs build

FROM nginx:alpine

COPY --from=builder /docs/site /usr/share/nginx/html


CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8080"]
