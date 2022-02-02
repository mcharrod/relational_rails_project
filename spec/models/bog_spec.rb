require 'rails_helper'

RSpec.describe Bog, type: :model do
  it 'exists' do
    boggy = Bog.create!(name: "Boggy", ph: 5.6, radioactive: false)
  end
end
