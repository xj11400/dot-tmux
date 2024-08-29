#!/usr/bin/env bash

# xdg path
# -------------------------------------------------------
#  set tmux plugin path :
#    $HOME/.tmux/plugins/ -> $HOME/.local/share/tmux/plugins/

reset_xdg_path(){
    PLUGIN_DIR="$HOME/.local/share/tmux/plugins/"

    if [[ -d $PLUGIN_DIR ]]
    then
        # echo "found tmux plugins ..."
        find $PLUGIN_DIR -type f -regex '.*\.tmux\|.*.sh' -print0 | xargs -0 sed -i 's/~\/\.tmux\/plugins/~\/\.local\/share\/tmux\/plugins/g'
    else
       echo "not found tmux plugins directory ..."
    fi
}

# resurrect
# -------------------------------------------------------
#  set resurrect dir :
#    default_resurrect_dir="$HOME/.cache/tmux/resurrect"

reset_resurrect(){
    PLUGIN_RESURRECT_DIR="$HOME/.local/share/tmux/plugins/tmux-resurrect"

    if [[ -d $PLUGIN_RESURRECT_DIR ]]
    then
       # echo "found tmux-resurrect ..."
           if [[ -f $PLUGIN_RESURRECT_DIR/scripts/helpers.sh ]]
           then
               # echo "found tmux-resurrect/scripts/helpers.sh ..."
               # echo "setting default_resurrect_dir ..."
               sed -i 's/default_resurrect_dir=.*/default_resurrect_dir=\"\$HOME\/\.cache\/tmux\/resurrect\"/g' $PLUGIN_RESURRECT_DIR/scripts/helpers.sh
           fi
    else
       echo "not found tmux-resurrect..."
    fi
}

main(){
    # echo ">>> reset tmux plugins path ..."
    reset_xdg_path

    # echo ">>> tmux-resurrect ..."
    reset_resurrect
}

main
