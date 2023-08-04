# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# List
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
alias l.="ls -A | egrep '^\.'"

# Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

# Free
alias free="free -mt"

# Use all cores
alias uac="sh ~/.bin/main/000*"

# Aliases for software managment
alias pacman="sudo pacman"
alias update="sudo pacman -Syyu"
alias upall="paru -Syu --noconfirm"

# PS
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# Add new fonts
alias update-fc='sudo fc-cache -fv'

# Hardware info --short
alias hw="hwinfo --short"

# Check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

# Get fastest mirrors in your neighborhood
alias mirrorlist="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrordelay="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrorscore="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrorage="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo /usr/local/bin/archlinux-vbox-share"

# Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# GPG
# Verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# Receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Shutdown or Reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# Systeminfo
alias probe="sudo -E hw-probe -all -upload"

# ex = EXtractor for all kinds of archives
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Source personal configurations and aliases
[[ -f ~/.zsh/aliases ]] && source ~/.zsh/aliases
[[ -f ~/.zsh/zshrc-personal ]] && source ~/.zsh/zshrc-personal
[[ -f ~/.zsh/zshrc-rockspoon ]] && source ~/.zsh/zshrc-rockspoon

neofetch
