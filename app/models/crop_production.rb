class CropProduction < ApplicationRecord
  belongs_to :crop
  belongs_to :year
end
