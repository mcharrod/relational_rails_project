require 'rails_helper'
RSpec.describe Frog, type: :model do
  # Try using "let" blocks. They are similar to a "before :each" but cleaner
  # and more Ruby-ish. They are very helpful when models/objects need multiple
  # tests to verify attributes and behaviors.

  # One thing to note: "let" (no !) will only create the object/model when
  # the variable is called, while "let!" (with the !) will create it immediately.
  # The block can be wrapped in "{ }" or "do end" (same thing as far as Ruby is concerned)

  # Created before test runs:
  # let!(:variable_name) { variable_value }

  # Created first time the variable is called:
  # let(:other_variable_name) do
  #   {
  #     bigger_variable_data: data,
  #     more_info: info
  #   }
  # end

  # it 'exists' do
  #   bog = Bog.create!(name: "Mossy Croaks", ph: 5.7, radioactive: false)
  #   garry = bog.frogs.create!(name: "garry", age: 4, singing: true)

  #   expect(garry).to be_a(Frog)
  # end

  # These models are created at the beginning of each "it" block ("let!")
  # These can be used across all tests within the "describe" block they live in (and all nested beneath it)
  let!(:bog) { Bog.create!(name: "Mossy Croaks", ph: 5.7, radioactive: false) }
  let!(:garry) { bog.frogs.create!(name: "garry", age: 4, singing: true) }

  it 'exists' do
    expect(gary).to be_a(Frog)
  end

  it 'has attributes' do
    # Same garry
    expect(garry.name).to eq('garry')
    expect(garry.age).to eq(4)
    expect(garry.singing).to be(True)
  end
end
