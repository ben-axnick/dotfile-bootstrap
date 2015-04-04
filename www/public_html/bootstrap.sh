export HOMESHICK_PATH="$HOME/.homesick/repos/homeshick"
export DOTFILES_PATH="$HOME/.homesick/repos/dotfiles"

# packages I can't live without
sudo apt-get install -y zsh git vim-nox tmux rbenv

# git banalities
git config --global user.name "Ben Axnick"
git config --global user.email ben@axnick.com.au

# initialize homeshick repos
mkdir -p $HOME/.homesick/repos
git clone git://github.com/andsens/homeshick.git $HOMESHICK_PATH
git clone https://baxnick@bitbucket.org/baxnick/settings.git $DOTFILES_PATH

$HOMESHICK_PATH/bin/homeshick link -f

printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc

gpg -d ~/.ssh/id_rsa.gpg > ~/.ssh/id_rsa
 
chmod 600 ~/.ssh/*
chmod 600 ~/.gnupg/*
chmod 600 ~/.aws/*

eval "$(ssh-agent)"
ssh-add
ssh-add -l

# pre-accept github.com, potentially dangerous as fingerprint not verified
ssh-keyscan github.com >> ~/.ssh/known_hosts

cd $DOTFILES_PATH
git submodule update --init --recursive
cd $HOME

mkdir $HOME/.yankring

$HOMESHICK_PATH/bin/homeshick link -f

chsh -s /usr/bin/zsh
