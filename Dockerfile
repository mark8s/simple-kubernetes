FROM centos:7
ENV LC_ALL=en_US.UTF-8
ENV PYTHONIOENCODING=UTF-8
RUN yum install -y python-pip python3-pip \
        openssh vim python3 python-netaddr3 sshpass openssl \
        python-netaddr openssh-clients rsync \
        && pip3 install --upgrade pip && pip install ansible netaddr -i https://pypi.douban.com/simple/
RUN ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""


WORKDIR /simple-kube
ARG BUILD
LABEL VERSION $BUILD
COPY . /simple-kube/
CMD ["bash"]
