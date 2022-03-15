#!/bin/bash
query=$(printf '%s' "$*" | tr ' ' '+' )
wal -i $query
feh $query

