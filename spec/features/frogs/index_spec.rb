require 'rails_helper'

RSpec.describe 'frog index', type: :feature do
  before do
    @kermi_bog = Bog.create!(name: "Kermi", ph: 4.5, radioactive: false)

    @frogger = @kermi_bog.frogs.create!(name: "Frogger Ribbit", age: 3, singing: false)
    @jim = @kermi_bog.frogs.create!(name: "Jim Hopper", age: 30, singing: true)
    @jr = @kermi_bog.frogs.create!(name: "Ribbit Downey Jr.", age: 15, singing: false)
  end

  it 'displays all attributes of all frogs on page' do
    visit "/frogs"

    expect(page).to have_content(@frogger.name)
    expect(page).to have_content(@frogger.age)
    expect(page).to have_content(@frogger.singing)

    expect(page).to have_content(@jim.name)
    expect(page).to have_content(@jim.age)
    expect(page).to have_content(@jim.singing)

    expect(page).to have_content(@jr.name)
    expect(page).to have_content(@jr.age)
    expect(page).to have_content(@jr.singing)
  end

  it 'has link on every page to navigate to the index' do
    visit '/bogs'

    expect(page).to have_link("View all frogs in existence")
  end
end
