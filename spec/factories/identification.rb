FactoryBot.define_persons_item_and_seed(:identification,
  full_natural_person_identification: proc {
    number '2545566'
    kind   'ID'
    issuer 'Argentina'
  }
)
