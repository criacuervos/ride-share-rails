class Passenger < ApplicationRecord

  validates :name, presence: true
  validates :phone_num, presence: true 

  def self.all_in_alpha_order
    return Passenger.all.order(name: :asc)
  end

end
