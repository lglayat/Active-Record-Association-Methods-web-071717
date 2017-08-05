class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    val = Song.all.find do |s|
      s.artist_id == id
    end

    # binding.pry
    val

    val2 = Genre.all.find do |g|
      g.id == val.genre_id
    end


    val2
  end

  def song_count
    #return the number of songs associated with the artist
    arr = []
    Song.all.each do |s|
      # binding.pry
      arr << s if s.artist_id == self.id
    end
    arr.size


  end

  def genre_count
    #return the number of genres associated with the artist
    count = 0
    Song.all.each do |s|
      count += 1 if s.genre_id == self.id
    end

    count


  end
end
