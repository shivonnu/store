# 既存の商品を一度すべて削除（二重登録を防ぐため）
Product.destroy_all

# 商品リストの作成
products = [
  # --- 三種の神器 ---
  { name: "[★] いにしえのマタタビ", price: 1985, description: "時代を超えて愛される、伝説の香りがするマタタビ。", image_url: "matatabi_old.png" },
  { name: "[★] 宇宙の法則を解くヒモ", price: 2500, description: "このヒモの動きには宇宙の真理が隠されているニャン。", image_url: "space_string.png" },
  { name: "[★] 伝説のダンボール城", price: 5888, description: "圧倒的な防御力を誇る。選ばれし猫のみが入城を許される。", image_url: "cardboard_castle.png" },
  
  # --- 普通の猫グッズ 12個 ---
  { name: "猫じゃらしデラックス", price: 1200, description: "最高級の羽根を使用した、食いつき抜群の逸品。", image_url: "nekojyarasi_deluxe.png" },
  { name: "自動給餌器：カリカリくん", price: 8500, description: "決まった時間にカリカリが出る魔法の箱。", image_url: "" },
  { name: "おしゃれな首輪（赤）", price: 1500, description: "鈴の音が心地よい、イタリア製の本革首輪。", image_url: "" },
  { name: "ふわふわキャットドーム", price: 4200, description: "冬でもポカポカ。一度入ったら出てこられない。", image_url: "" },
  { name: "またたび入りネズミ", price: 800, description: "猫を狂わせる、罪深いおもちゃ。", image_url: "" },
  { name: "爪研ぎタワー（麻）", price: 3800, description: "思う存分ガリガリできる。家具を守る救世主。", image_url: "" },
  { name: "猫用システムトイレ", price: 5500, description: "臭わない、汚れない。人間にも優しい設計。", image_url: "" },
  { name: "高級フリーズドライささみ", price: 980, description: "無添加・無着色。素材の味をそのままに。", image_url: "" },
  { name: "ひんやりアルミプレート", price: 2100, description: "夏場の熱中症対策に。ひんやり気持ちいい。", image_url: "" },
  { name: "キャットウォーク設置キット", price: 15000, description: "壁を遊び場に変える。アクティブな猫に。", image_url: "" },
  { name: "ブラッシング専用ブラシ", price: 1800, description: "ごっそり抜ける。マッサージ効果も抜群。", image_url: "" },
  { name: "猫専用ポータブルキャリー", price: 6200, description: "通院や旅行に。通気性抜群で安心。", image_url: "" }
]

# データを保存
products.each do |p|
  Product.create!(p)
end

puts "商品データを15個作成したニャ！"