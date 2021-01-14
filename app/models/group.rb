class Group < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :book_groups
    has_many :books, through: :book_groups
    has_one_attached :icon

    validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  
    validates :icon, presence: true
end
