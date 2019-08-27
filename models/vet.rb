require_relative('../db/sql_runner')

class Vet

  attr_accessor :name, :mobile
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @mobile = options['mobile']
  end

  def save()
    sql = "INSERT INTO vets
    (
      name,
      mobile
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @mobile]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE vets
    SET
    (
      name,
      mobile
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @mobile, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM vets
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM vets
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    vet = Vet.new(result)
    return vet
  end

  # def owner()
  #   owner = Owner.find(@id)
  #   return owner
  # end

  def self.all()
    sql = "SELECT * FROM vets"
    vet_data = SqlRunner.run(sql)
    vets = map_items(vet_data)
    return vets
  end

  def self.map_items(vet_data)
    return vet_data.map { |vet| Vet.new(vet) }
  end

end
