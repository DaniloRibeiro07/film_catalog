class Genre < ApplicationRecord
  has_many :movie
  has_many :director
end
