require 'rails_helper'
RSpec.describe 'bog index', type: :feature do
  before do
    @boggy = Bog.create!(name: "Boggy", ph: 5.6, radioactive: false)
    @boggerson = Bog.create!(name: "Boggerson", ph: 5.7, radioactive: false)
    @bogington = Bog.create!(name: "Bogington", ph: 4.6, radioactive: true)

  end

  it 'displays name of all bogs' do
    visit '/bogs'

    expect(page).to have_content(@boggy.name)
    expect(page).to have_content(@boggerson.name)
    expect(page).to have_content(@bogington.name)
  end

  it 'has a link to frog index page from every page on site' do
  end
end
