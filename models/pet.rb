require_relative( '../db/sql_runner' )

class Pet

  attr_reader :name, :date_of_birth, :type_of_pet, :owner_name, :owner_mobile, :id )
# vet_id???
  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @ype_of_pet = options['ype_of_pet']
    @owner_name = options['owner_name']
    @owner_mobile = options['owner_mobile']
    @vet_id = options['vet_id'].to_i
  end

  def save()
    sql = "INSERT INTO vets
    (
      name,
      date_of_birth,
      type_of_pet,
      owner_name,
      owner_mobile,
      vet_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @date_of_birth, @type_of_pet, @owner_name, @owner_mobile, @vet_id]
    results = SqlRunner.run(sql, values)
    @name = results.first()['name']
  end
end
