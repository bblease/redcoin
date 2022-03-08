# based on the dockerfile from
# https://github.com/garethfuller/hardhat-template/blob/main/Dockerfile.dev

FROM node:16-alpine

ENV APP_ROOT /app

RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}
ADD . ${APP_ROOT}

# git is needed to run hardhat (?)
RUN apk add git

# install and start the hardhat chain
RUN yarn install
EXPOSE 8545

# start hardhat chain and deploy contracts
CMD './start_chain.sh'