class Reading < ActiveRecord::Base
  # ステータス：read=読んだ　reading=読んでいる　tsundoku=積読　want=読みたい
  enum status: %i(read reading tsundoku want)

  belongs_to :user
  belongs_to :book

  def add(user, status, book)
    Reading.transaction do
      reading = user.readings.build
      reading.book_id = book[:id]
      reading.status = status
      new_book = reading.book.build
      new_book.title = book[:title]
      new_book.isbn = book[:asin]
      new_book.image_url = book[:image_url]
      new_book.genre = genre

    end
  end
end
