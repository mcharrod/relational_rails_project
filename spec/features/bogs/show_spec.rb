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

  it 'counts all frogs in the bog' do
    frog1 = @toxic_waste.frogs.create!(name: "Ribbit Downey Jr", age: 5, singing: true)
    frog2 = @toxic_waste.frogs.create!(name: "Frogger", age: 4, singing: false)
    frog3 = @toxic_waste.frogs.create!(name: "Toady", age: 5, singing: true)
    frog4 = @toxic_waste.frogs.create!(name: "Demi Lovatoad", age: 10, singing: true)

    visit "bogs/#{@toxic_waste.id}"

    expect(page).to have_content("Frog population for this bog: 4")
  end

  it 'has a link to that particular bogs frog index' do
    visit "/bogs/#{@toxic_waste.id}"

    click_link("View all frogs in this bog")
    expect(current_path).to eq("/bogs/#{@toxic_waste.id}/frogs")
  end
end
