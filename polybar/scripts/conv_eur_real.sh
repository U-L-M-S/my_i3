#!/usr/bin/env bash

# simple script that gets the price from euro in real and shows usr

Url="https://www.currency-calc.com/EUR_BRL"

real_price="$(curl -s $Url | grep -oP '(?<=1 Euro =  )[^ ]*' | sed 's/ //g')" 
echo -e "%{B#212128} 1€ %{F#ffd670}↭" %{F#70d6ff}"R$"${real_price} 
