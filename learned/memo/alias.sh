# =====以下2021-11-05追加===========================
## git
alias ga='git add'
alias gcm='git commit -m'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gl='git log --oneline'
alias gb='git branch'
alias gc='git checkout'
alias gg='git grep'
alias gf='git fetch -p'
alias gp='git push'

## command
alias vial='cd; vi ~/.zshrc'
alias caal='cd; cat ~/.zshrc'
alias soz='cd; source ~/.zshrc'
alias tu='cd ~/Documents/tukushi'
alias wh='cd ~/Documents/tukushi/what_i_lerned_today'

## general
alias ll='ls -la'
alias llg='ls -la | grep'

## ruby rails
alias be='bundle exec'
alias berc='bundle exec rails c'
alias bers='bundle exec rails s'
alias be='bundle exec'
alias dcm='bundle exec rails db:drop db:create db:migrate'
alias dcmtest='bundle exec rails db:drop db:create db:migrate RAILS_ENV=test'
alias test='RAILS_ENV=test'
### bundle config set path 'vendor/bundle'
### キャッシュを消す
### git rm -r --cached .

## dockerコマンド追加(2021-11-08)
alias dcr='docker-compose run'
alias dc='docker-compose'

## homebrewのpathを変更(2021-11-08)
export PATH="/opt/homebrew/bin:$PATH"


echo "The shell used is ${SHELL}."

eval "$(rbenv init -)"
