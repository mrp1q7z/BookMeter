class AmazonBook
  include ActiveModel::Model

  attr_accessor :isbn, :asin, :title, :image_url, :authors, :publish, :publication_date, :amazon_url

  def self.find(keyword, page)
    res = Amazon::Ecs.item_search(keyword,
      { search_index: 'Books', response_group: 'Medium', country: 'jp', item_page: page || 1 })

    return nil unless res

    results = []
    res.items.each do |item|
      element = item.get_element("ItemAttributes")
      image = item.get_hash('SmallImage')

      book = AmazonBook.new()
      book.amazon_url = "http://www.amazon.co.jp/dp/#{item.get('ASIN')}"
      book.title = element.get("Title")
      book.image_url = item.get_hash('SmallImage')["URL"] if image
      book.authors = element.get_array("Author").join(", ")
      book.publish = element.get("Manufacturer")
      book.publication_date = element.get("PublicationDate")
      book.isbn = element.get('ISBN')
      book.asin = item.get('ASIN')
      results << book
    end
    # AmazonECS item_page に指定できるのは1〜10まで
    # それ以上の商品を見せる場合は、MoreSearchResultsUrl を使う必要がある！
    Rails.logger.debug "taoka99: total_pages=#{res.total_pages}"
    add_dummy_array(results, page, res.total_results, res.items.size)
  end

  private

  def self.add_dummy_array(results, page, total_results, page_size)
    if page == 1
      dummy = (1..(total_results - page_size)).to_a
      results.concat(dummy)
    else
      dummy = (1..(page_size * (page.to_i - 1))).to_a
      results = dummy.concat(results)
      dummy = (100..(total_results - (page_size * (page.to_i - 1)))).to_a
      results.concat(dummy)
    end

    Rails.logger.debug "taoka0: page=#{page}, total_results=#{total_results}, page_size=#{page_size}"
    Rails.logger.debug "taoka1:" + results.inspect
    results = Kaminari.paginate_array(results).page(page).per(page_size)
    Rails.logger.debug "taoka2:" + results.inspect
    results
  end
end