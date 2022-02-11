FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    sudo \
    vim \
    curl \
    file \
    unzip \
    gcc \
    gdb \
    binutils \
    # 日本語化も忘れず
    locales

RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8

WORKDIR /opt
RUN curl -OL https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh && \
    sh Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -rf Anaconda3-2019.10-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH
RUN pip install --upgrade pip

COPY mount_folder /mount_folder
WORKDIR /
