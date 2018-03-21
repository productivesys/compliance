class Relationship < ApplicationRecord 
  include Garden::Fruit
  belongs_to :related_person, class_name: 'Person'
  validates :kind, relationship_kind: true
end
