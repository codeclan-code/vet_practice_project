require_relative('../models/pet')
require_relative('../models/vet')

vet1 = Vet.new({'name' => 'Dr Jones'})
vet1 = Vet.new({'name' => 'Dr Smith'})

vet1.save
vet2.save

pet1 = Pet.new({
  'name' => 'Caesar',
  'date_of_birth' => '29.02.19',
  'type_of_pet' => 'Dog',
  'owner_name' => 'Mr Clark',
  'owner_mobile' => '07776 776 545',
  'vet_id' => vet1.id
  })

  pet2 = Pet.new({
    'name' => 'Growler',
    'date_of_birth' => '16.09.19',
    'type_of_pet' => 'Snake',
    'owner_name' => 'Miss Evermond',
    'owner_mobile' => '0434 774 111',
    'vet_id' => vet2.id
    })

        pet1.save
        pet2.save
