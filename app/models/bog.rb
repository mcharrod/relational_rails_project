class Bog < ApplicationRecord
  has_many :frogs, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :ph

  validates_inclusion_of :radioactive, in: [true, false]

  def population
    self.frogs.count
  end

  def self.recently_created
    order(created_at: :desc)
  end

  def alphabetized_frogs
    self.frogs.order(:name)
  end
end
