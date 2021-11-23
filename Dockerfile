FROM nikolaik/python-nodejs:python3.7-nodejs12

LABEL version="1.0.0"
LABEL repository="https://github.com/serverless/github-action"
LABEL homepage="https://github.com/serverless/github-action"
LABEL maintainer="Serverless, Inc. <hello@serverless.com> (https://serverless.com)"

LABEL "com.github.actions.name"="Serverless"
LABEL "com.github.actions.description"="Wraps the Serverless Frameork to enable common Serverless commands."
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

RUN npm i -g serverless@1.72.0
RUN apt-get update
RUN apt-get install -y gawk build-essential
RUN wget http://ftp.gnu.org/gnu/glibc/glibc-2.25.tar.gz
RUN tar zxf glibc-2.25.tar.gz
RUN cd glibc-2.25
RUN mkdir build
RUN cd build
RUN ../configure --prefix=/usr
RUN make install
ENTRYPOINT ["serverless"]
