require_relative('../db/sql_runner')

class Owner

  attr_accessor :name, :mobile, :email
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @mobile = options['mobile']
    @email = options['email']
  end

  def save()
    sql = "INSERT INTO owners
    (
      name,
      mobile,
      email
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @mobile, @email]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE owners
    SET
    (
      name,
      mobile,
      email
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @mobile, @email, @id]
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

  def owner()
    owner = Owner.find(@id)
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

  def self.ownerspets(owner_id)
    sql = "SELECT * FROM pets WHERE owner_id = $1"
    values  = [owner_id]
    pet_data = SqlRunner.run(sql, values)
    pets = map_items(pet_data)
    return pets
  end

end
