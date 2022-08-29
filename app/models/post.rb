class Post < ApplicationRecord
    belongs_to :user

    validates :title, :body, presence: { message: "musn't be blank"}
end
