#!/bin/bash
#copies all files in files/install/ to root
#sovrascrive file esistenti
#mantiene permessi, owner,...

FILES=${FILES:-../files}

[ -d "${FILES}/install/" ] && cp -a ${FILES}/install/. $ROOT