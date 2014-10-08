alias rddm='rake db:drop; rake db:create; rake db:migrate'
alias rdm='rake db:migrate'
alias rds='rake db:seed'
alias rdtp='rake db:test:prepare'
alias rdsl='rake db:structure:load'

rc () { rails console $@ }
rs () { rails server --binding=127.0.0.1 $@ }

rct () { RAILS_ENV=test rails console $@ }
rst () { RAILS_ENV=test rails server --binding=127.0.0.1 $@ }

rails_versions() {
  filename=Gemfile.lock
  for gemfile in **/$filename; do
    app=$(echo $gemfile | sed "s/\/$filename//g")
    rails_version=$(cat $gemfile | grep ' rails (\d')
    printf "$fg[magenta] $app: $fg[green] $rails_version"
    echo "$reset_color"
  done
}
