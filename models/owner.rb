require_relative('../db/sql_runner')

class Owner

  attr_accessor :owner_name, :owner_mobile
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @owner_name = options['owner_name']
    @owner_mobile = options['owner_mobile']
  end

  def save()
    sql = "INSERT INTO owners
    (
      owner_name,
      owner_mobile
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@owner_name, @owner_mobile]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE owners
    SET
    (
      owner_name,
      owner_mobile
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@owner_name, @owner_mobile, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    owner = Owner.new(result)
    return owner
  end

  def self.all()
    sql = "SELECT * FROM owners"
    owner_data = SqlRunner.run(sql)
    owners = map_items(owner_data)
    return owners
  end

  def self.map_items(owner_data)
    return owner_data.map { |owner| Owner.new(owner) }
  end

end
