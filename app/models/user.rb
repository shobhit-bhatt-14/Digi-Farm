class User < ApplicationRecord
    has_many :connections
    has_many :discussions
    has_many :posts

    has_many :sender, class_name: "Message"
    has_many :receiver, class_name: "Message"

    belongs_to :region

    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be valid email address" }

    # after_create_commit { broadcast_append_to "users" }
end
