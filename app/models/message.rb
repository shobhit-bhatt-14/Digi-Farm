class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :name, uniqueness: true

  scope :public_messages, -> { where(is_private: false) }
  # scope :private_messages, -> { where(is_private: true) }

  after_create_commit { broadcast_append_to "messages" }
end
