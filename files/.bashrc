# ...
shopt -s histappend
export HISTSIZE=1000
export HISTCONTROL=ignoreboth
export PATH=$HOME/bin:$PATH
export PLATFORM_SDK_ROOT="/srv/mer"
export ANDROID_ROOT="$HOME/Sailfish/src"
alias sfossdk="$PLATFORM_SDK_ROOT/sdks/sfossdk/mer-sdk-chroot"
if [ ! -d /parentroot ]; then
    export HISTFILE="$HOME/.bash_history"
else
    env="sfossdk"
    [ -d /parentroot/parentroot ] && env="habuild"
    if [ "$env" = "sfossdk" ]; then
        export RELEASE=`cat /etc/os-release | grep VERSION_ID | cut -d'=' -f2`
        alias habuild="ubu-chroot -r $PLATFORM_SDK_ROOT/sdks/ubuntu"
    fi
    export HISTFILE="$HOME/.bash_history-$env"
fi