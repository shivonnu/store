# ネコじゃらしストア

猫グッズのデモECアプリです。[★] のついた三種の神器をカートに入れ、合言葉「Railsで世界を救うニャ！」で決済するとエンディングが見られます。

## セットアップ

```bash
bundle install
bin/rails db:setup
bin/rails server
```

ブラウザで http://localhost:3000 を開きます。

商品画像は `app/assets/images/` に置き、商品の `image_url` にファイル名を入れます。開発環境ではナビの「商品を追加」から登録できます。

## Render への公開

無料の Web Service（Docker）で出せます。カードは不要です。

Environment は次のようにします。

| 名前 | 値 |
| --- | --- |
| `WEB_CONCURRENCY` | `1` |
| `SECRET_KEY_BASE` | Render の Generate で作ってよい（長いランダム値） |
| `RAILS_ENV` | `production` |

`RAILS_MASTER_KEY` は **Generate しない**。すでに入っているなら削除する。誤った値のままだと `ActiveSupport::MessageEncryptor::InvalidMessage` で落ちます。

無料枠は 15 分アクセスが無いとスリープし、次の表示まで約 1 分かかることがあります。SQLite は再起動で消えるので、起動時に seed し直します。
