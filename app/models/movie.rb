class Movie < ApplicationRecord
  enum status: { draft: false, published: true }
  enum released: { no_release: false, release: true }
  belongs_to :director
  belongs_to :genre
end
