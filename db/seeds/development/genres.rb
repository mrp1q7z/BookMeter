genres = %w(文庫 単行本 コミック ライトノベル その他)

genres.each do |genre|
  Genre.create!(name: genre)
end