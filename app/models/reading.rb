class Reading < ActiveRecord::Base
  # ステータス：read=読んだ　reading=読んでいる　tsundoku=積読　want=読みたい
  enum status: %i(read reading tsundoku want)

  belongs_to :user
  belongs_to :book
end
