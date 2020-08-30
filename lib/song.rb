class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create(name)
    song = self.new
    save
    @name
  end
  
  def self.destroy_all
    @@all.clear
  end

end
