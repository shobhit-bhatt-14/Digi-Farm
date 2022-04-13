class Region < ApplicationRecord
  has_many :discussions
  has_many :users
end
