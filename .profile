alias l='ls --color=auto' #ls with color
alias lr='ls -tr --color=auto' #ls  with color reversed by date
alias ll='ls -l --color=auto' #ls list with color
alias lla='ls -al --color=auto' #ls list all files with color
alias llr='ls -ltr --color=auto'  #ls list with color reversed by date
alias llar='ls -altr --color=auto'  #ls list all files with color reversed by date
alias lls='ls -alSr --color=auto'  #ls list all files with color reversed by size
alias vimlr='function _vimlr(){ vim `ls -tr $1 | tail -1`; };_vimlr' # open most recent file
