$ rbenv -v
rbenv 1.1.2

$ ruby -v
ruby 2.5.1

$ rails -v
Rails 5.2.1

$ node -v
v12.16.1

# DB（PostgreSQL）のインストール
$ brew install postgresql
$ postgres -V
postgres (PostgreSQL) 13.1
$ brew services start postgresql
Successfully started `postgresql` (label: homebrew.mxcl.postgresql)
$ psql postgres
psql (13.1)
Type "help" for help.

postgres=#

# アプリ(scaffold_app)作成
$ rails new scaffold_app -d postgresql
Bundle complete! 18 Gemfile dependencies, 78 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

## アプリのディレクトリに移動
$ cd scaffold_app

# DB作成
$ bin/rails db:create
Created database 'scaffold_app_development'
Created database 'scaffold_app_test'

# サーバ起動
$ bin/rails s
=> Booting Puma
=> Rails 5.2.4.4 application starting in development
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.6 (ruby 2.5.1-p57), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:3000
Use Ctrl-C to stop

# http://localhost:3000/ で確認
$ bin/rails generate scaffold user name:string address:string age:integer