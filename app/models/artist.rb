class Artist < ActiveRecord::Base 
  # Artists and genres have many songs
  has_many :songs
  has_many :genres, through: :songs
end
