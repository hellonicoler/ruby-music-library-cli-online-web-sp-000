class Artist
 

  attr_accessor :name
  attr_reader :songs
  
  extend Concerns::Findable
  
  # empty array to hold artists
  @@all = []
  
  # accepts a name for new artist
  def initialize(name)
   # sets the name of an artist
    @name= name
    # creates a songs property set to empty array
    @songs = []
  end
  
  def songs
    @songs
  end
  
  # returns all artists
  def self.all
    @@all
  end
  
  # clears artist array
  def self.destroy_all
    @@all.clear
  end
  
  # save artist to array
  def save
    @@all << self
  end
  
  # creates, saves, returns artist
  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end
  
  # adds a song to an artist
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end
  
end