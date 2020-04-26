FROM debian:buster

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y curl
RUN apt-get install -y dpkg
RUN apt-get install -y jq
RUN apt-get install -y libcurl3-gnutls
RUN apt-get install -y bzip2
RUN apt-get install -y make
RUN apt-get install -y openssh-client

RUN curl -sOL `curl -s https://api.github.com/repos/roswell/roswell/releases/latest | jq -r '.assets | .[] | select(.name|test("deb$")) | .browser_download_url'`
RUN dpkg -i roswell*.deb

RUN ros install sbcl-bin