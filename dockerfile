FROM alpine:3.19

RUN apk update && apk add --no-cache openssh python3 sudo

RUN mkdir -p /var/run/sshd && ssh-keygen -A

RUN echo 'root:root' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
