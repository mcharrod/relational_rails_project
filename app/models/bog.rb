class Bog < ApplicationRecord
  has_many :frogs

  validates_presence_of :name
  validates_presence_of :ph

  validates_inclusion_of :radioactive, in: [true, false]
end
