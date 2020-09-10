# 万葉様新入社員教育課題

## テーブル
### User
データ型|カラム名
:---|:---
string|name
string|email
string|password_digest

### Task
データ型|カラム名
:---|:---
text|task_name
text|description
integer|user_id
datetime|deadline
integer|priority
string|status

### Label
データ型|カラム名
:---|:---
integer|user_id
integer|task_id


## Herokuへのデプロイ手順
1. デプロイするディレクトリへ移動する
1. アセットプリコンパイルする
  `$ rails assets:precompile RAILS_ENV=production`
1. コミットする
  `$ git add -A`
  `$ git commit -m "init"`
1. Herokuに新しいアプリを作成する
  `$ heroku create`
1. Heroku buildpackを追加する（必要に合わせて）
  `$ heroku buildpacks:set heroku/ruby`
  `$ heroku buildpacks:add --index 1 heroku/nodejs`
1. Herokuにデプロイする
  `$ git push heroku master`
1. データベースを移行する
  `$ heroku run rails db:migrate`
1. アプリケーションにアクセスしてアプリ名を確認する
  `heroku config`
