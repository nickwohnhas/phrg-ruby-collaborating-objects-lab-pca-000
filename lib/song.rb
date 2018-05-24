require 'pry'
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    artist_name = file_name.split("-")[0].strip
    song_name = file_name.split("-")[1].strip
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_instance = Song.new(song_name)

    new_instance.artist = new_artist
    new_instance

  end



end
