class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes



  def note_contents=(contents)
    contents.each do |content|
      if content.strip != ""
         self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
  def genre_id
    self.genre ? self.genre.name : nil
  end
  
  def genre_id=(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
end
