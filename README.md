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
