class Conversation < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: true

  scope :public_rooms, -> { where(is_private: false) }
  scope :private_rooms, -> { where(is_private: true) }
end
