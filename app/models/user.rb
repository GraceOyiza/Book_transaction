class User < ApplicationRecord

    has_many :books, foreign_key: :creator_id, dependent: :destroy
    has_many :groups, foreign_key: :creator_id
end
