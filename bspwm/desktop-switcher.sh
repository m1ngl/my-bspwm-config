#!/bin/bash

export node_desktop=$1

bspc node -d \^$node_desktop
bspc desktop -f \^$node_desktop
