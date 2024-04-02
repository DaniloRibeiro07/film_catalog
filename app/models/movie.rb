class Movie < ApplicationRecord
  enum status: { draft: false, published: true }
  enum released: { no_release: false, release: true }
  belongs_to :director
  belongs_to :genre
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
end
