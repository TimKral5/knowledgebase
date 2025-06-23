FROM debian:latest

WORKDIR /src
COPY . .

RUN apt update && apt upgrade -y
RUN apt install -y mkdocs pip

RUN pip install -r requirements.txt --break-system-packages

RUN mkdocs build

CMD [ "mkdocs", "serve", "-a", "0.0.0.0:8000" ]
