class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    val = nil
    Genre.all.each do |g|
      val = g.name if g.id == self.genre_id
    end
    val
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # its_drake = nil
    # Artist.all.each do |a|
    #   its_drake = a if a.name == "Drake"
    # end
    # self.artist = its_drake
    #
    # its_drake

    drake = Artist.find_or_create_by(name: "Drake")
    self.artist = drake
  end
end
