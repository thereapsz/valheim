#!/bin/bash
cd valheim_server
docker build -t valheim:latest .
cd ../backup
docker build -t valheim:backup .
docker-compose up -d
