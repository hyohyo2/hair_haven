# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by!(email: ENV["ADMIN_EMAIL"]) do |admin|
  admin.password = ENV["ADMIN_PASSWORD"]
end

user1 = User.find_or_create_by!(email: "test@test") do |user|
  user.last_name = "テスト"
  user.first_name = "太郎"
  user.last_name_kana = "テスト"
  user.first_name_kana = "タロウ"
  user.gender = "male"
  user.post_code = "123-4567"
  user.address = "東京都新宿区"
  user.telephone_number = "1234567890"
  user.is_active = true
  user.password = "example"
end

user2 = User.find_or_create_by!(email: "test1@test") do |user|
  user.last_name = "テスト"
  user.first_name = "花子"
  user.last_name_kana = "テスト"
  user.first_name_kana = "ハナコ"
  user.gender = "male"
  user.post_code = "234-5678"
  user.address = "北海道函館市"
  user.telephone_number = "0123456789"
  user.is_active = true
  user.password = "example"
end


item1 = Item.find_or_create_by!(name: "ブラック") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/rails.png")),filename: "item1.png")
  item.name = "ブラック"
  item.kind = "male_wig"
  item.size = "medium"
  item.length = "bob_hair"
  item.color = "黒"
  item.detail = "黒髪ヘアー"
  item.price = "30000"
  item.is_active = true
end

item2 = Item.find_or_create_by!(name: "ブロンド") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/rails.png")),filename: "item1.png")
  item.name = "ブロンド"
  item.kind = "female_wig"
  item.size = "small"
  item.length = "short_hair"
  item.color = "金髪"
  item.detail = "きれいなブロンドヘアーです"
  item.price = "50000"
  item.is_active = true
end

item3 = Item.find_or_create_by!(name: "櫛") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/rails.png")),filename: "item1.png")
  item.name = "櫛"
  item.kind = "accessory"
  item.size = "not_size"
  item.length = "not_length"
  item.color = "なし"
  item.detail = "この櫛で髪をとくとサラサラになります。"
  item.price = "2000"
  item.is_active = true
end

tag1 = Tag.find_or_create_by!(name: "男性用") do |tag|
  tag.name = "男性用"
end

tag2 = Tag.find_or_create_by!(name: "女性用") do |tag|
  tag.name = "女性用"
end

tag3 = Tag.find_or_create_by!(name: "小物") do |tag|
  tag.name = "小物"
end



notice_genre1 = NoticeGenre.find_or_create_by!(name: "お知らせ") do |notice_genre|
  notice_genre.name = "お知らせ"
end

notice_genre2 = NoticeGenre.find_or_create_by!(name: "営業日") do |notice_genre|
  notice_genre.name = "営業日"
end

notice_genre3 = NoticeGenre.find_or_create_by!(name: "新商品") do |notice_genre|
  notice_genre.name = "新商品"
end

notice1 = Notice.find_or_create_by!(title: "忘れ物について") do |notice|
  notice.notice_genre_id = notice_genre1.id
  notice.title = "忘れ物について"
  notice.detail = "8月31日来客された方でハンカチを忘れた方がいらっしゃいましたら、ご連絡ください。"
end

notice2 = Notice.find_or_create_by!(title: "営業日について") do |notice|
  notice.notice_genre_id = notice_genre2.id
  notice.title = "営業日について"
  notice.detail = "９月は毎週水曜日と日曜日は休業しています。ご迷惑おかけしますがよろしくお願いいたします。"
end

notice3 = Notice.find_or_create_by!(title: "新商品の発売について") do |notice|
  notice.notice_genre_id = notice_genre3.id
  notice.title = "新商品の発売について"
  notice.detail = "10月1日から新商品のアイテムを発売します。ご予約は電話にて受け付けています。"
end

# 商品タグ設定
ItemTag.find_or_create_by!(item: item1, tag: tag1)
ItemTag.find_or_create_by!(item: item1, tag: tag2)

ItemTag.find_or_create_by!(item: item2, tag: tag2)

ItemTag.find_or_create_by!(item: item3, tag: tag1)
ItemTag.find_or_create_by!(item: item3, tag: tag2)
ItemTag.find_or_create_by!(item: item3, tag: tag3)

# いいね商品設定
Favorite.find_or_create_by!(user: user1, item: item1)
Favorite.find_or_create_by!(user: user1, item: item2)
Favorite.find_or_create_by!(user: user1, item: item3)

Favorite.find_or_create_by!(user: user2, item: item2)

# 配送先設定

address1 = Address.find_or_create_by!(name: "田中花子") do |address|
  address.user_id = user1.id
  address.post_code = "234-5678"
  address.address = "沖縄県那覇市"
  address.name = "田中花子"
end

address2 = Address.find_or_create_by!(name: "田中次郎") do |address|
  address.user_id = user1.id
  address.post_code = "345-6789"
  address.address = "北海道函館市"
  address.name = "田中次郎"
end

address3 = Address.find_or_create_by!(name: "田中四葉") do |address|
  address.user_id = user2.id
  address.post_code = "876-5432"
  address.address = "広島県広島市"
  address.name = "田中四葉"
end