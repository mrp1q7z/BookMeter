class BooksController < ApplicationController
  def search
    @keywd = params[:keywd]
    Amazon::Ecs.debug = true
    @res = Amazon::Ecs.item_search(@keywd,
       {:search_index   => 'Books',
        :response_group => 'Medium',
        :country        => 'jp'}
    )
  end
end
