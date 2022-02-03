class Bog < ApplicationRecord
  has_many :frogs
  
  validates_presence_of :name
  validates_presence_of :ph

  validates :radioactive,
            inclusion: { in: [true, false] }
end
