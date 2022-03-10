#!/bin/sh

yarn hardhat node &
yarn hardhat run scripts/deploy.ts --network localhost
tail -f /dev/null