if status is-interactive
	# Commands to run in interactive sessions can go here

	# Remove fish greeting
	set -g fish_greeting

	# Run fastfetch configuration on shell startup
	fastfetch -c /etc/xdg/fastfetch/term.jsonc
end

starship init fish | source
