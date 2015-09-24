genres = Genre.all

Book.create!(
  title: '下町ロケット',
  isbn: '4094088962',
  genre: genres.sample,
  image_url: '',
)
Book.create!(
    title: '掟上今日子の備忘録',
    isbn: '4062192020',
    genre: genres.sample,
    image_url: '',
)
Book.create!(
    title: 'サイレーン 1',
    isbn: '4063872521',
    genre: genres.sample,
    image_url: '',
)

100.times do |i|
  Book.create!(
    title: "タイトル#{i}",
    genre: genres.sample,
  )
end