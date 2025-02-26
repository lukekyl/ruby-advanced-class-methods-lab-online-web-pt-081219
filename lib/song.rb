class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.all
    @@all
  end
  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    @@all << song
    song
  end
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name 
    song.save
    song
  end
  def self.find_by_name(name)
    self.all.find{|song|song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      song = self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort_by{|song|
      song.name
    }
  end
  def self.new_from_filename(file)
    file_array = file.chomp(".mp3").split(" - ")
    name = file_array[1]
    artist = file_array[0]
    
    song = self.new
    song.name = name
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end
  def self.destroy_all
    @@all.clear
  end
end
