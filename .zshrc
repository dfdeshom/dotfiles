# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dfdeshom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(virtualenv )

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/dfdeshom/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/dfdeshom/bin:/home/dfdeshom/.local/bin:/opt/vagrant/bin"
# storm, maven
export PATH=$PATH:/home/dfdeshom/code/storm-0.8.1/bin:/home/dfdeshom/code/apache-maven-3.2.3/bin

# ant
export PATH=$PATH:/home/dfdeshom/code/apache-ant-1.8.4/bin

# spark
export PATH=$PATH:/home/dfdeshom/code/spark-1.1.0-bin-hadoop1/bin
alias ipyspark='IPYTHON=1 pyspark'


alias cls='clear'

#v-env wrapper
export WORKON_HOME=$HOME/code/cogtree/venvs/
source ~/.local/bin/virtualenvwrapper.sh

# colors
export TERM=xterm-256color
 
# ssh identities
eval `ssh-agent -s`
ssh-add

# recent dirs using cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 20

export JAVA_HOME=/usr/lib/jvm/java-7-oracle/
export JRE_HOME=/usr/lib/jvm/java-7-oracle/jre/
