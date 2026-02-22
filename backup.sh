#!/bin/bash

DATE=$(date +%F)
BACKUP_DIR=./backups/$DATE

mkdir -p $BACKUP_DIR

docker run --rm \
  -v loki_data:/volume \
  -v $(pwd)/backups/$DATE:/backup \
  alpine \
  tar czf /backup/loki.tar.gz -C /volume .

docker run --rm \
  -v grafana_data:/volume \
  -v $(pwd)/backups/$DATE:/backup \
  alpine \
  tar czf /backup/grafana.tar.gz -C /volume .1