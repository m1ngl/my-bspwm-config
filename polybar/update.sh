#!/bin/bash

if [ -n "$(pacman -Qu)" ]; then
  echo "$(pacman -Qu|wc -l)个更新可用"
else
  echo "已是最新"
fi
