class TopController < ApplicationController
  def index
    if current_user
      redirect_to home_index_url
      return
    end

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
