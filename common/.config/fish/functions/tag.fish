function tag
  echo "generate ctags"
  ctags --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R .
end
