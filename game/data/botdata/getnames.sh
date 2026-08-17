#!/bin/bash
for i in {6000..6400}
do
    curl -s "https://secure.runescape.com/m=hiscore_oldschool/overall.ws?table=0&page=$i" \
        | grep user1= \
        | sed 's/^.*user1=//' \
        | sed 's/".*$//' \
        | grep -v "Binary" >> botnames.txt
done