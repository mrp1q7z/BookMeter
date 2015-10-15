class BooksController < ApplicationController
  def search
    @keywd = params[:keywd]
    Amazon::Ecs.debug = true
    @res = AmazonBook.find(@keywd, params[:page])
    # dummy = []
    # (@res.total_results - @res.item_page).times { dummy << "" }
    # @res.concat(dummy)
    # @res = Kaminari.paginate_array(@res).page(params[:page]).per(@res.item_page)
  end
end
