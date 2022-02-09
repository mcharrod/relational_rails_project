require 'rails_helper'

RSpec.describe Bog, type: :model do
  it 'exists' do
    boggy = Bog.create!(name: "Boggy", ph: 5.6, radioactive: false)

    expect(boggy).to be_a(Bog)
  end

  describe 'validations' do
    # this test should give an error
    it { should allow_value(3).for(:radioactive) }
    # it { should allow_value("cupcake").for(:radioactive)}

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:ph) }
  end

  describe 'relationship' do
    it { should have_many(:frogs) }
  end
end
