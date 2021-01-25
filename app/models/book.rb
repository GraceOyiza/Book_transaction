class Book < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :book_groups
  has_many :groups, through: :book_groups

  validates :title, presence: true, length: { minimum: 3, maximun: 35 }
  validates :amount, presence: true
  validates_numericality_of :amount, greater_than_or_equal_to: 1

  scope :desc, -> { includes(:creator).order('created_at DESC') }

  scope :desc_group, -> { desc.select { |book| book.groups.exists? } }

  scope :desc_no_group, -> { desc.reject { |book| book.groups.exists? } }
end
