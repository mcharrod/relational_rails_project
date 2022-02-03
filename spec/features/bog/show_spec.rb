require 'rails_helper'

RSpec.describe 'Bog show', type: :feature do
  before do
    @toxic_waste = Bog.create!(name: "Dump", ph: 2.1, radioactive: true)
  end

  it 'displays alll data for one bog' do

    visit "/bogs/#{@toxic_waste.id}"

    expect(page).to have_content(@toxic_waste.name)
    expect(page).to have_content(@toxic_waste.ph)
    expect(page).to have_content(@toxic_waste.radioactive)
  end
end
