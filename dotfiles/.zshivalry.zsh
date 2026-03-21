# ============================================================
#  ⚔️  zshivalry.zsh — Aliases in the 15th Century Tongue
#  Add to your shell with: source ~/path/to/zshivalry.zsh
# ============================================================

# --- Core Commands ---
alias hark='ls'                          # Hark! What lurks in this directory?
alias smite='rm'                         # Smite this file from the disk!
alias counsel='man'                      # Counsel me, O wise tome
alias unfurl='cat'                       # Unfurl and read this scroll
alias begone='kill'                      # Begone, foul process!
alias bestow='chmod'                     # Bestow rights upon this file
alias hail='ping'                        # Hail, distant server!
alias hence='exit'                       # Hence! I bid thee farewell
alias erect='mkdir'                      # Erect a new directory forthwith
alias transport='mv'                     # Transport this file to yonder location
alias proclaim='echo'                    # Proclaim these words unto the terminal
alias scour='find'                       # Scour the realm for a file
alias seeketh='grep'                     # Seeketh a string within scrolls
alias annals='history'                   # Consult the annals of past commands
alias muster='top'                       # Behold the muster roll of processes
alias missive='curl'                     # Dispatch a missive to yonder server
alias conjure='touch'                    # Conjure a new empty scroll into existence
alias forge='touch'                      # Forge a new file upon the anvil
alias beget='touch'                      # Beget a new file, that it may come into being

# --- Navigation through the realm ---
wend() { cd "$@"; }          # Wend thy way to a directory: wend /path/to/dir
venture() { cd "$@"; }       # Venture into a directory: venture /path/to/dir
journey() { cd "$@"; }       # Journey to a directory: journey /path/to/dir
pilgrimage() { cd "$@"; }    # Embark on a pilgrimage: pilgrimage /path/to/dir
alias retreat='cd ..'        # Retreat to the parent keep
alias homecastle='cd ~'      # Return to thy home castle

# --- "scribe anew" for cp ---
scribe() {
    if [ "$1" = "anew" ]; then
        shift
        cp "$@"
    else
        echo "Didst thou mean: scribe anew <source> <dest>?"
    fi
}

# --- "by mine authority" for sudo ---
by() {
    if [ "$1" = "mine" ] && [ "$2" = "authority" ]; then
        shift 2
        sudo "$@"
    else
        echo "Thou must invoke: by mine authority <command>"
    fi
}

# --- "ride forth to" for ssh ---
ride() {
    if [ "$1" = "forth" ] && [ "$2" = "to" ]; then
        shift 2
        ssh "$@"
    else
        echo "Thou must invoke: ride forth to <host>"
    fi
}

# --- "wherefore art thou" for pwd ---
wherefore() {
    if [ "$1" = "art" ] && [ "$2" = "thou" ]; then
        pwd
    else
        echo "Didst thou mean: wherefore art thou?"
    fi
}

# --- Git incantations ---
alias "inscribe"='git add . && git commit -m'   # inscribe "thy message here"
alias "dispatch"='git push'                      # dispatch to the realm
alias "receive"='git pull'                       # receive from the realm

# ============================================================
#  Example usage:
#
#  hark                              → ls
#  wend /var/log                     → cd /var/log
#  venture /var/log                  → cd /var/log
#  journey /var/log                  → cd /var/log
#  pilgrimage /var/log               → cd /var/log
#  retreat                           → cd ..
#  homecastle                        → cd ~
#  wherefore art thou                → pwd
#  by mine authority unfurl /etc/hosts → sudo cat /etc/hosts
#  by mine authority unfurl /var/log/syslog | seeketh "error"
#  scribe anew file.txt backup.txt   → cp file.txt backup.txt
#  smite old_file.txt                → rm old_file.txt
#  erect new_project                 → mkdir new_project
#  ride forth to user@remotehost     → ssh user@remotehost
#  inscribe "fixed the dragon bug"   → git add . && git commit -m "..."
#  counsel seeketh                   → man grep
#  hence                             → exit
#  conjure notes.txt                 → touch notes.txt
#  forge report.md                   → touch report.md
# ============================================================
