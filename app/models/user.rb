class User < ApplicationRecord
    has_many :connections
    has_many :discussions
    has_many :posts

    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be valid email address" }
end
