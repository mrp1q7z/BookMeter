class BooksController < ApplicationController
  def search
    @keywd = params[:keywd]
    @res = AmazonBook.find(@keywd)
  end
end
