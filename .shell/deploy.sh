timestamp() { date +"%F_%H-%M" }

production_deploy() {
  git tag $(timestamp)
  git push && git push --tags
  cap production deploy
}
