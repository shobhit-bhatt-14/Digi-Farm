class User < ApplicationRecord
    has_many :connections
    has_many :discussions
    has_many :posts
end
