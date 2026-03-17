#!/usr/bin/env bash

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
session_name=$(echo "$input" | jq -r '.session_name // empty')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')

# ANSI colors
reset="\033[0m"
orange="\033[38;5;208m"
cyan="\033[38;5;81m"
purple="\033[38;5;141m"
green="\033[38;5;114m"
mint="\033[38;5;48m"
yellow="\033[38;5;221m"
red="\033[38;5;196m"
dim="\033[2m"

# Directory
if [[ "$cwd" == "$HOME" ]]; then
    dir_display="~"
elif [[ "$cwd" == "$HOME/"* ]]; then
    dir_display="~/${cwd#$HOME/}"
else
    dir_display="$cwd"
fi

status=""

# Session name
if [ -n "$session_name" ]; then
    status+="${purple} ${session_name}${reset} "
fi

# Directory
status+="${cyan} ${dir_display}${reset}"

# Separator
status+="${dim} |${reset}"

# Model
status+=" ${orange}󰚩 ${model}${reset}"

# Context remaining with color coding
if [ -n "$remaining" ]; then
    pct=$(printf '%.0f' "$remaining")
    if (( pct > 50 )); then
        ctx_color="$green"
    elif (( pct > 25 )); then
        ctx_color="$yellow"
    else
        ctx_color="$red"
    fi
    status+="${dim} |${reset} ${ctx_color}󰾅 ${pct}%${reset}"
fi

# Session cost
if [ -n "$cost" ]; then
    cost_display=$(printf '$%.2f' "$cost")
    status+="${dim} |${reset} ${yellow}${cost_display}${reset}"
fi

echo -e "$status"
