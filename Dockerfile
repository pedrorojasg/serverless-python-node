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
RUN pip install --platform manylinux2010_x86_64 --implementation cp --python 3.7 --only-binary=:all: --upgrade --target awsbundle cryptography==36.0 django-phonenumber-field==6.0.0 phonenumbers==8.12.5
ENTRYPOINT ["serverless"]
