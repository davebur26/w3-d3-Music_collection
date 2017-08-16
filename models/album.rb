require_relative('../db/sql_runner')

class Album

  attr_accessor(:title, :genre)
  attr_reader(:id, :artist_id)

  def initialize( album_details )
    @id = album_details['id'].to_i() if album_details['id']
    @artist_id = album_details['artist_id']
    @title = album_details['title']
    @genre = album_details['genre']
  end

  def save()
    sql = '
      INSERT INTO albums (title, artist_id, genre)
      VALUES ($1, $2, $3) RETURNING id;
      '
      values = [@title, @artist_id, @genre]
      results_array = SqlRunner.run(sql, values)
      @id = results_array[0]['id'].to_i()
  end

  def Album.delete_all()
    sql = 'DELETE FROM albums'
    SqlRunner.run(sql)
  end

end
