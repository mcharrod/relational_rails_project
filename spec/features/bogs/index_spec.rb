require 'rails_helper'
RSpec.describe 'bog index', type: :feature do
  before do
    @cattail = Bog.find_or_create_by!(name: "Cattail waters", ph: 4.7, radioactive: false)
    @log = Bog.find_or_create_by!(name: "The log lodge", ph: 5.7, radioactive: false)
    @moss = Bog.find_or_create_by!(name: "Mossy Oaks", ph: 5.0, radioactive: false)
    @glow = Bog.find_or_create_by!(name: "Glowing Peats", ph: 1.9, radioactive: true)
    @neon = Bog.find_or_create_by!(name: "Neon waters", ph: 2.8, radioactive: true)

    @kermit = @log.frogs.create!(name: "Kermit", age: 40, singing: true)
  end

  it 'displays name of all bogs' do
    visit '/bogs'

    expect(page).to have_content(@cattail.name)
    expect(page).to have_content(@log.name)
    expect(page).to have_content(@moss.name)
    expect(page).to have_content(@glow.name)
    expect(page).to have_content(@neon.name)
  end

  it 'has a link to bog index page from every page on site' do
    visit '/'
    click_link("View all bogs in existence")
    expect(current_path).to eq('/bogs')

    visit '/frogs'
    click_link("View all bogs in existence")
    expect(current_path).to eq('/bogs')

    visit "/frogs/#{@kermit.id}"

    visit "/bogs/#{@cattail.id}"
    click_link("View all bogs in existence")
    expect(current_path).to eq('/bogs')

    visit '/bogs/new'
    click_link("View all bogs in existence")
    expect(current_path).to eq('/bogs')

    visit "/bogs/#{@cattail.id}/frogs"
    click_link("View all bogs in existence")
    expect(current_path).to eq('/bogs')
  end

  it 'has a link to create a new bog' do
    visit '/bogs'
    click_link("Create new bog")

    expect(current_path).to eq('/bogs/new')
  end

  it 'sorts by most recently created' do
    visit '/bogs'
    save_and_open_page

    expect(@cattail.name).to appear_before(@log.name)
    expect(@log.name).to appear_before(@moss.name)
    expect(@glow.name).to appear_before(@neon.name)
  end
end
