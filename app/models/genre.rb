class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    count = 0
    Song.all.each do |g|
      count += 1
    end
    count
  end

  def artist_count
    # return the number of artists associated with the genre
    count = 0
    Song.all.each do |s|
      count += 1 if s.genre_id == self.id
    end
    count

  end

  def all_artist_names
    # return an array of strings containing every musician's name
    arr = []
    Song.all.each do |s|
      if s.genre_id == self.id
        Artist.all.each do |a|
          arr << a.name if s.artist_id == a.id
        end
      end
    end

    arr
  end
end
