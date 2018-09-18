echo "Commencing testing binary locations with 'which' (no output indicates that it is not in PATH"
echo "Testing ruby"
which ruby
echo "Testing rails"
which rails
echo "Testing gem"
which gem
echo "Testing bundler"
which bundle

echo "Testing sqlite3"
which sqlite3

echo "Testing ruby with env"
/usr/bin/env ruby --version

# $SNAP/bin/rails secret
