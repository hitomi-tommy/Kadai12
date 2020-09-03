# 万葉様新入社員教育課題

### テーブル
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
string|status|

### Label
データ型|カラム名
:---|:---
integer|user_id
integer|task_id
