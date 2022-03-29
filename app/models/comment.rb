class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :feed, counter_cache: :count
end
