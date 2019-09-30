class Note < ActiveRecord::Base
  # add associations here
  validates :content, presence: true
  belongs_to :song

  def song_ids=(ids)
    ids.each do |id|
      song = Song.find(id)
      self.songs << song
    end
  end

end
