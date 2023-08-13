#!/bin/sh

__select_files() {
	echo "$1" | fzf \
		--multi --inline-info --reverse --no-separator --border none --cycle --height 100% \
		--preview 'chezmoi diff --reverse --color=true ~/{}' \
		--preview-window bottom,80%,noborder
}

cha() {
	if [ $# -gt 0 ]; then
		selected_files=$@
	else
		files=$(chezmoi status | awk '{print $2}')
		[ -z "$files" ] && return 1

		selected_files=$(__select_files "$files")
		[ -z "$selected_files" ] && return 1
	fi

  for i in $(echo "$selected_files" | xargs); do
		chezmoi add "$i"
	done
}

chy() {
	if [ $# -gt 0 ]; then
		selected_files=$@
	else
		files=$(chezmoi status | awk '{print $2}')
		[ -z "$files" ] && return 1

		selected_files=$(__select_files "$files")
		[ -z "$selected_files" ] && return 1
	fi

	for i in $(echo "$selected_files" | xargs); do
		chezmoi apply "$i"
	done
}

chf() {
	if [ $# -gt 0 ]; then
		selected_files=$@
	else
		files=$(chezmoi managed)
		[ -z "$files" ] && return 1

		selected_files=$(echo "$files" | fzf \
			--multi --inline-info --reverse --no-separator --border none --cycle --height 70% \
			--preview '[ -f {} ] && bat --style=plain --color=always {}' \
			--preview-window right,70%,noborder)
		[ -z "$selected_files" ] && return 1
	fi

  for i in $(echo "$selected_files" | xargs); do
		chezmoi forget "$i"
	done
}