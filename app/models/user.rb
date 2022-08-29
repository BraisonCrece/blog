class User < ApplicationRecord
    has_many :posts

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
end
