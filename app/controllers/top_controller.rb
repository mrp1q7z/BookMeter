class TopController < ApplicationController
  def index
    # 注目の本
    @attention_books = Book.all

    # 人気の本
    @popular_books = []
    genres = Genre.all
    genres.each do |genre|
      @popular_books << Book.where(genre: genre)
    end
  end
end
