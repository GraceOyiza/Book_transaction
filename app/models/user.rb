class User < ApplicationRecord
  has_many :books, foreign_key: 'creator_id', dependent: :destroy
  has_many :groups, foreign_key: :creator_id

  validates :username, presence: true, length: { minimum: 3, maximum: 35 }
  validates_uniqueness_of :username

  def total_grouped_books
    grouped = books.select { |item| item.groups.exists? }
    grouped.map(&:amount).inject(:+) || 0
  end

  def total_ungrouped_books
    grouped = books.reject { |item| item.groups.exists? }
    grouped.map(&:amount).inject(:+) || 0
  end

  def total_book_price
    grouped_price = total_grouped_books
    ungrouped_price = total_ungrouped_books

    grouped_price + ungrouped_price
  end
end
