books = Book.all
books.each do |book|
  book.authors.create!(
    name: "著者#{book.id}"
  )
end