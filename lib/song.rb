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
    self.all << song
    song
  end
  
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end
  
  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end
  
  def self.find_by_name(title)
    search = self.all.detect {|song| song.name === title}
    search
  end
  
  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result
      result
    else
      self.create_by_name(title)
    end
  end
  
  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end
  
  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    file_array[1] = file_array[1].chomp(".mp3")
    song = self.new
    song.name = file_array[0]
    song.artist_name = file_array[1]
    song
  end
  
  def self.destroy_all
    @@all.clear
  end

end
