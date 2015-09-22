Book.create!(
  title: '下町ロケット',
  isbn: '4094088962',
  image_url: '',
)
Book.create!(
    title: '掟上今日子の備忘録',
    isbn: '4062192020',
    image_url: '',
)
Book.create!(
    title: 'サイレーン 1',
    isbn: '4063872521',
    image_url: '',
)

100.times do |i|
  Book.create!(
    title: "タイトル#{i}",
  )
end