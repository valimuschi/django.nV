FROM python:2-alpine

COPY . /app
WORKDIR /app
RUN apk add --no-cache gawk sed bash grep bc coreutils
RUN pip install -r requirements.txt
RUN chmod +x reset_db.sh && bash reset_db.sh
RUN chmod +x run_app_docker.sh

# EXPOSE port 8000 for communication to/from server
EXPOSE 8000

# CMD specifcies the command to execute container starts running.
CMD ["/app/run_app_docker.sh"]