FROM python:3.9-alpine AS builder
WORKDIR /docs

RUN pip install --no-cache-dir mkdocs mkdocs-material

COPY . .

RUN mkdocs build

# Create a empty scratch image with only the built site and necessary files
FROM scratch
COPY --from=builder /docs/site /usr/share/nginx/html
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

# Add Nginx binary and configuration
COPY --from=builder /usr/sbin/nginx /usr/sbin/nginx
COPY --from=builder /etc/nginx /etc/nginx


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]