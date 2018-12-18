#!/bin/bash
# Install every deb file in files/deb

FILES=${FILES:-../files}

[ -d ${FILES}/deb ] && dpkg -iR ${FILES}/deb
