#!/bin/sh
nvm install $(cat .nvmrc)
nvm use $(cat .nvmrc)
npm install -g yarn@1.22.0
yarn policies set-version 1.22.0
yarn install
