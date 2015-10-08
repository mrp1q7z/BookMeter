class AmazonBook
  include ActiveModel::Model

  attr_accessor :isbn, :asin, :title, :image_url, :authors, :publish, :publication_date, :page_url

  def self.find(keyword)
    res = Amazon::Ecs.item_search(keyword,
      { search_index: 'Books', response_group: 'Medium', country: 'jp' })

    return nil unless res

    results = []
    res.items.each do |item|
      element = item.get_element("ItemAttributes")
      image = item.get_hash('SmallImage')

      book = AmazonBook.new()
      book.page_url = "http://www.amazon.co.jp/dp/#{item.get('ASIN')}"
      book.title = element.get("Title")
      book.image_url = item.get_hash('SmallImage')["URL"] if image
      book.authors = element.get_array("Author").join(", ")
      book.publish = element.get("Manufacturer")
      book.publication_date = element.get("PublicationDate")
      book.isbn = element.get('ISBN')
      results << book
    end
    results
  end
end