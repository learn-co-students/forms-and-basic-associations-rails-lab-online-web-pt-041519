class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    self.genre ? self.genre.name : nil
  end
  
  def genre_name=(name) 
    self.genre = Genre.find_or_create_by(name: name)
  end
  
  def artist_name 
    self.artist ? self.artist.name : nil
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def note_contents
      @contents = []
      self.notes.each do |note|
        @contents<< note.content
      end  
      @contents 
    
  end  
  
  def note_contents=(content_array)
    content_array.each do |content|
      if !content.empty?
        @note = Note.find_or_create_by(content: content) 
        self.notes << @note
      end  
    end 

  end 

end
