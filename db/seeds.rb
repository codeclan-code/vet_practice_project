require_relative('../models/pet')
require_relative('../models/vet')
require_relative('../models/pettype')
require('pry')

vet1 = Vet.new({'name' => 'Dr Smith'})
vet1.save

vet2 = Vet.new({'name' => 'Dr Jones'})
vet2.save

pettype1 = PetType.new ({'pettype' => 'Cat'})
pettype2 = PetType.new ({'pettype' => 'Dog'})
pettype3 = PetType.new ({'pettype' => 'Horse'})
pettype4 = PetType.new ({'pettype' => 'Other'})

pettype1.save
pettype2.save
pettype3.save
pettype4.save


pet1 = Pet.new({
  'name' => 'Julius',
  'date_of_birth' => '12.12.19',
  'owner_name' => 'Mr Clark',
  'owner_mobile' => '0131 6648384',
  'vet_id' => vet1.id,
  'pettype_id' => pettype1.id
   })

pet1.save

pet2 = Pet.new({
  'name' => 'King',
  'date_of_birth' => '12.12.12',
  'owner_name' => 'Miss Evermond',
  'owner_mobile' => '0131 123456',
  'vet_id' => vet2.id,
  'pettype_id' => pettype2.id
   })

pet2.save



binding.pry
nil
