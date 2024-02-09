#!/usr/bin/env bash

case $(setxkbmap -query | grep layout | awk '{ print $2 }') in
          us) setxkbmap il ;;
          il) setxkbmap us ;;
           *) setxkbmap us ;;
esac

