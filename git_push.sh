#!/bin/bash
cd ~/printer_data/config
git add .
current_date=$(date +"%Y-%m-%d %T")
git commit -m "Auto-backup from printer: $current_date"
git push
