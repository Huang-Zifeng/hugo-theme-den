#!/bin/sh
hugo
npm_config_yes=true npx pagefind --source "public" --bundle-dir mysearch
hugo server
