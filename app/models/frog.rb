class Frog < ApplicationRecord
  belongs_to :bog

  validates_presence_of :name
  validates_presence_of :age
end
