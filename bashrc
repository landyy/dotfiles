#
# ~/.bashrc
#

#screenfetch
screenfetch -c ,4

#print some pretty colored blocks. Kind looks out of place :/
#perl -CADS -lwe '
#my $block = shift || (chr(0x2588) x 3);
#for (["", 0]) {
#    my ($bold, $offset) = @$_;
#    my @range = map $offset + $_, 0..7;
#    print "\n\t\t\t",map("\e[${bold}38;5;${_}m$block", @range), "\e[0m";
#}
#     ' "$@"

# Prompt
if [ -n "$SSH_CONNECTION" ]; then
export PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 7)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼ \[$(tput setaf 7)\][ssh]\"; else echo \"\[$(tput setaf 1)\]└╼ \[$(tput setaf 7)\][ssh]\"; fi) \[$(tput setaf 7)\]"
else
export PS1="\[$(tput setaf 4)\]┌─╼ \[$(tput setaf 7)\][\w]\n\[$(tput setaf 4)\]\$(if [[
\$? == 0 ]]; then echo \"\[$(tput setaf 4)\]└────╼\"; else echo \"\[$(tput setaf 4)\]└╼\"; fi) \[$(tput setaf 7)\]"
fi

# Colored XTERM promp
case "$TERM" in
    xterm-termite) color_prompt=yes;;
esac

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
	color_prompt=
    fi
fi
#Colors??
alias ls="ls --color=always"

# Color man pages
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Color support
eval `dircolors -b dircolors-solarized/dircolors.256dark`
