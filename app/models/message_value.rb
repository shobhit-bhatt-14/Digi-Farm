class MessageValue < ApplicationRecord
    belongs_to :user
    belongs_to :message

    # after_create_commit { broadcast_append_to "message_values" }
    # after_update_commit { broadcast_update }
end