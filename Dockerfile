FROM debian:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    valgrind \
    make cmake \
    libreadline-dev \
    lsof \
    # -- supposedly needed for webserv/irc later --
    # netcat-openbsd \
    nano \
    # -- if you prefer vim --
    # vim \
    # -- if you plan on using git --
    # git \
    # -- optional stuff for lldb --
    # python3 \
    # gdb \
    # lldb \
    # clang \
    # -----------------
    && apt-get clean

WORKDIR /app

CMD ["bash"]
