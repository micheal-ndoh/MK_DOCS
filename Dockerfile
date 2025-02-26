# Stage 1: Build the Python application
FROM python:3.9-slim as builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

FROM nginx:alpine

COPY --from=builder /app /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD sh -c "python /usr/share/nginx/html/app.py --host=0.0.0.0 --port=5000 & nginx -g 'daemon off;'"
