require_relative("../db/sql_runner")

class Artist

  attr_accessor(:name)
  attr_reader(:id)

  def initialize(params)
    @id = params['id'].to_i() if params['id']
    @name = params['name']
  end

  def save
    sql = 'INSERT INTO artists (name) VALUES ($1) RETURNING *;'
    returned_data = SqlRunner.run(sql, [@name])

    @id = returned_data[0]['id'].to_i()
  end


  def Artist.delete_all
    sql = 'DELETE FROM artists'
    SqlRunner.run(sql)
  end

end
