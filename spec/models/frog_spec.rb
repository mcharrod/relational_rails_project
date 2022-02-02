require 'rails_helper'
RSpec.describe Frog, type: :model do
  it 'exists' do
    bog = Bog.create!(name: "Mossy Croaks", ph: 5.7, radioactive: false)
    garry = bog.frogs.create!(name: "garry", age: 4, singing: true)

    expect(garry).to be_a(Frog)
  end
end
