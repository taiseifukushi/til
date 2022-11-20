class Movie < ApplicationRecord
  has_many :tags
  belongs_to :actor
end
