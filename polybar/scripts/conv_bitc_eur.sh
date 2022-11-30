#!/usr/bin/env bash

# simple script that gets the price from euro in real and shows usr

Url="https://coinmarketcap.com/currencies/bitcoin/btc/eur/"

real_price="$(curl -s $Url | grep -oP '(?<=1 Euro =  )[^ ]*' | sed 's/ //g')" 
echo -e "%{B#212128} 1€ %{F#ffd670}Euro" %{F#70d6ff}"R$"${real_price} 
