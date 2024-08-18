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

taro = User.find_or_create_by!(email: "test@test") do |user|
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

hanako = User.find_or_create_by!(email: "test1@test") do |user|
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


mikan = Item.find_or_create_by!(name: "みかん") do |item|
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/rails.png")),filename: "item1.png")
  item.name = "みかん"
  item.kind = "male_wig"
  item.size = "medium"
  item.length = "bob_hair"
  item.color = "黒"
  item.detail = "黒髪ヘアー"
  item.price = "30000"
  item.is_active = true
end