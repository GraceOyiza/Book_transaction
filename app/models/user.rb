class User < ApplicationRecord

    has_many :books, foreign_key: :creator_id, dependent: :destroy
    has_many :groups, foreign_key: :creator_id

    validates :username, presence: true, length: { minimum: 3, maximum: 35 }
    validates_uniqueness_of :username
end
