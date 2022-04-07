class CropProduction < ApplicationRecord
  has_many :crops
  has_many :years
end
