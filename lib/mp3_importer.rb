require 'pry'
class MP3Importer

attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []

  end

  def files
    Dir.entries(@path).select{|element| element.end_with? "3"}
  end

  def import
    files.each do |string|
      artist_name = string.split("-")[0]
      song_name = string.split("-")[1]
      song = Song.new(song_name)
      new_artist = Artist.find_or_create_by_name(artist_name)
      new_artist.add_song(song)
    end
  end
end
