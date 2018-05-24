require 'pry'

class Artist
  attr_accessor :name, :artist
@@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self
    @songs << song
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if @@all.any? { |artist| artist.name == name }
      @@all.find { |element| element.name == name }
    else
      artist = self.new(name)
      @@all << artist
      artist
    end
  end

  def print_songs

    @songs.each{|song| puts song.name}
  end

  def self.add_song(song_name)
    @songs << song_name
  end

end


