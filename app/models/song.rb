class Song < ActiveRecord::Base
  #Songs belong to artist & genre
  #have many notes
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  #sets the genre to the genre of the specified name / reader
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  #returns the genre name / writer
  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        note = Note.find_or_create_by(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end
