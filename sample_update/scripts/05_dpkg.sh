#!/bin/bash
#installa tutti i *.deb in files/deb

FILES=${FILES:-../files}

[ -d ${FILES}/deb ] && dpkg -iR ${FILES}/deb