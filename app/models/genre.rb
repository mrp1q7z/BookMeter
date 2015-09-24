class Genre < ActiveRecord::Base
  has_one :book
end
