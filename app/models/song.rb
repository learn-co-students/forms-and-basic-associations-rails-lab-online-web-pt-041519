class Song < ActiveRecord::Base

  belongs_to :genre
  belongs_to :artist
  has_many :notes

  accepts_nested_attributes_for :notes

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

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
    notes.each { |n| self.notes.build(content:n) unless n.blank? }
  end

  def note_contents
    self.notes.map { |n| n.content if n.content.length > 0 }.compact
  end

end
