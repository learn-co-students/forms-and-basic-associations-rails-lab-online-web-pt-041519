class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  # Set genre from specified name
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
 
  def genre_name
    self.genre.name if !self.genre.nil?
  end

  # Set artist from specified name
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
 
  def artist_name
    self.artist.name if !self.artist.nil?
  end

  # Set notes content from specified array
  def note_contents=(array)
    array.each do |i|
      if !i.empty?
        note = Note.find_or_create_by(content: i)
        self.notes << note
      end
    end
  end
 
  def note_contents
    self.notes.map(&:content) if !self.notes.empty?
  end

end
