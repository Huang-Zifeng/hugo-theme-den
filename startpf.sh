#!/bin/sh
hugo
npm_config_yes=true npx pagefind --source "docs" --bundle-dir mysearch
hugo server
