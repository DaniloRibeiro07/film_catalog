class Movie < ApplicationRecord
  enum status: { draft: 0, published: 2 }
  enum released: { no_release: 0, release: 2 }
  belongs_to :director
  belongs_to :genre
end
