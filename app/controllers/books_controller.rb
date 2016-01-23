class BooksController < ApplicationController
  def search
    @keywd = params[:keywd]
    Amazon::Ecs.debug = true
    @res = AmazonBook.find(@keywd, params[:page])
  end

  def show
    @book = AmazonBook.new
    book = amazon_book_params
    @book.title = book[:title]
    @book.asin = book[:asin]
    @book.amazon_url = @book.amazon_url
    @book.image_url = book[:image_url]
  end

  # 読んだ本に追加
  def add_read
    book = amazon_book_params
    Reading.add(status: Reading.status.read, book)
  end

  private

  def amazon_book_params
    params.require(:amazon_book).permit(:asin, :title, :image_url)
  end
end
