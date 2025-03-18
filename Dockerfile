FROM Python: 3.9-alpine
WORKDIR /app
COPY requirements.txt ./
COPY . .
EXPOSE 5000
CMD [" Gunicorn ","-b","0.0.0.0.5000","main.app"]
