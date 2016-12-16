function set_title()
{
    ORIGN_PS1=${ORIGN_PS1:-$PS1}
    export PS1="$ORIGN_PS1\033]0;$*\007"
}
