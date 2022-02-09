class Frog < ApplicationRecord
  belongs_to :bog

  validates_presence_of :name
  validates_presence_of :age

  def self.singing
    Frog.where('singing = true')
  end

  
end
