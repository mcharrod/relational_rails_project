require 'rails_helper'

RSpec.describe 'frog index', type: :feature do
  before do
    @kermi_bog = Bog.create!(name: "Kermi", ph: 4.5, radioactive: false)

    @frogger = @kermi_bog.frogs.create!(name: "Frogger Ribbit", age: 3, singing: true)
    @jim = @kermi_bog.frogs.create!(name: "Jim Hopper", age: 30, singing: true)
    @jr = @kermi_bog.frogs.create!(name: "Ribbit Downey Jr.", age: 15, singing: true)
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
    visit '/'
    click_link("View all frogs in existence")

    expect(current_path).to eq('/frogs')

    visit '/bogs'
    click_link("View all frogs in existence")

    expect(current_path).to eq('/frogs')

    visit "/bogs/#{@kermi_bog.id}"
    click_link("View all frogs in existence")

    expect(current_path).to eq('/frogs')

    visit "/frogs/#{@jr.id}"
    click_link("View all frogs in existence")

    expect(current_path).to eq('/frogs')

    visit "/bogs/#{@kermi_bog.id}/frogs"
    click_link("View all frogs in existence")

    expect(current_path).to eq('/frogs')
  end
end

RSpec.describe 'Singing frogs only index' do
  before do
    @rock = Bog.create!(name: "Rock Concert Bog", ph: 5.6, radioactive: true)

    # singing celebrity frogs
    @demi = @rock.frogs.create!(name: "Demi Lovatoad", age: 30, singing: true)
    @iggy = @rock.frogs.create!(name: "Iggy Hop", age: 30, singing: true)
    @ozzy = @rock.frogs.create!(name: "Oggy Frogspawn", age: 50, singing: true)
    @zack = @rock.frogs.create!(name: "Zack Effrog", age: 50, singing: true)

    # non - singing frogs (concert goers)
    @frank = @rock.frogs.create!(name: "Franklin Frog", age: 12, singing: false)
    @danny = @rock.frogs.create!(name: "Danny Devitoad", age: 68, singing: false)
  end

  it 'only shows frogs which are singing' do
    visit '/frogs'

    expect(page).not_to have_content(@frank.name)
    expect(page).not_to have_content(@danny.name)
  end

  it 'has a link to the frog edit page' do
    visit '/frogs'

    within("#frog_#{@demi.id}") do
      click_button("Update this frog")
    end
    expect(current_path).to eq("/frogs/#{@demi.id}/edit")
  end

  it 'has a delete button next to each frog on the index' do
    visit '/frogs'

    # now she's here
    expect(page).to have_content(@iggy.name)

    within("#frog_#{@iggy.id}") do
      click_button("Delete this frog")
    end

    expect(current_path).to eq('/frogs')
    
    # now she's not
    expect(page).not_to have_content(@iggy.name)
  end
end
