class Group < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :book_groups
    has_many :books, through: :book_groups
end
