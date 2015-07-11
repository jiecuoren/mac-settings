# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
# android-ndk

eval (python -m virtualfish)
eval (python -m virtualfish auto_activation global_requirements)

set -x GOPATH "/Users/leigu1/work/other_work/FPPush_wrapper/"
#set -x GOPATH "/Users/leigu1/work/other_work/async_service/"
set -x ANDROID_HOME "/Applications/adt-bundle-mac/sdk"
set -x NDK_ROOT "/Applications/adt-bundle-mac/android-ndk-r8e/"
set -x AAPT_ROOT "/Applications/adt-bundle-mac/sdk/build-tools/21.1.2/"
set -x DART_SDK "/usr/local/Cellar/dart/1.10.0/libexec/bin/"

set -x PATH $PATH "$HOME/bin" "$NDK_ROOT" "$ANDROID_HOME/tools" "$ANDROID_HOME/platform-tools" "$GOPATH" "$AAPT_ROOT" "$DART_SDK" 

set -x FLASK_ENV "development"
function gb
    git branch
end

function gbr
    git branch -r
end

function checkjar
    open /Applications/luyten-0.4.4.jar
end

function sublime
    open /Applications/Sublime\ Text.app/
end

function fbn
    find ./ -name $argv
end

function gl
    git log 
end

function gio
    git log --oneline
end

function v
    vim $argv;
end

function p
    pwd;
end

function la
    ls -a;
end

function gs
    git status;
end

function gadd
    git add .;
end

function gpl
    git pull --all;
end

function gps
    git push;
end

function gcm --description "gcm <message>"
    git commit -m $argv[1]
end

function ft
    ps -ef | grep $argv
end

function fp
    lsof -i:$argv
end

function myrm
    mv $argv ~/Desktop/Trash/
end

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_command $history[1]
    thefuck $fucked_up_command > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_command
    end
end

if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end

# OPAM configuration
. /Users/leigu1/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
