class Domicile < ApplicationRecord
  include Garden::Fruit
  validates :country, country: true 
  
  def name
    [id, country, city, street_address, street_number].join(',')    
  end 
end
