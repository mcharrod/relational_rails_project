require 'rails_helper'

RSpec.describe Bog, type: :model do
  # See detailed notes in frog_spec

  # it 'exists' do
  #   boggy = Bog.create!(name: "Boggy", ph: 5.6, radioactive: false)
  # end

  # Created before each test runs ("let!")
  let!(:boggy) { Bog.create!(name: "Boggy", ph: 5.6, radioactive: false) }

  it 'exists' do
    expect(boggy).to be_a(Bog)
  end
end
