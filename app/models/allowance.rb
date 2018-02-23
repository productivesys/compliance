class Allowance < ApplicationRecord
  belongs_to :person
  has_one :allowance_seed
  has_many :attachments, as: :seed_to
  scope :current, ->(person) { where(person: person, replaced_by_id: nil) }
end
