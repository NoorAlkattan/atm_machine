class AtmMachine < ActiveRecord::Base
   geocoded_by :address
   after_validation :geocode
    has_many :transactions
   # reverse_geocoded_by :latitude, :longitude, :address => :atm_machine
    #after_validation :reverse_geocode
   #  validates :address, :presence => true
end
