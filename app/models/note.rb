class Note < ActiveRecord::Base
  # Notes belong to songs.
  belongs_to :songs
end
