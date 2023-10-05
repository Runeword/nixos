__tmux() {
	local item_pos

	item_pos=$(tmux list-sessions -F '#{session_id} #{session_attached}' | awk '$2 == "1" {print NR}')

	# tmux display-popup -E "tmux list-panes -a -F '#{window_index} #{window_name}' | fzf | cut -c 1-1 | xargs tmux select-window -t"

	session=$(
		tmux ls -F "#{session_name}" 2>/dev/null | fzf \
			--reverse \
			--cycle \
			--jump-labels=3 \
			--height 50% \
			--delimiter=' ' \
			--header-first \
			--header='<C-k> kill  <C-Del> kill all' \
			--bind='ctrl-k:reload-sync(tmux kill-session -t {1})' \
			--bind='ctrl-delete:execute(tmux kill-server)+abort' \
			--bind='enter:execute(echo {1})+abort' \
			--bind='tab:down,btab:up' \
			${TMUX:+--bind='focus:execute-silent(tmux switch-client -t {1})'} \
			${TMUX:+--bind="load:pos($item_pos)"}
	)

	[ -z "$session" ] && return 1

	if [ -n "$TMUX" ]; then
		tmux switch-client -t "$session"
	else
		tmux attach-session -t "$session"
	fi
}

__new_session() {
	printf 'new session name : ' && read -r session

	[ -z "$session" ] && return 1

	if [ -n "$TMUX" ]; then
		tmux new-session -d -s "$session"
		tmux switch-client -t "$session"
	else
		tmux new-session -s "$session"
	fi
}
