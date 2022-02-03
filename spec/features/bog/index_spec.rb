require 'rails_helper'
RSpec.describe 'bog index', type: :feature do
  # Same note from frog_spec about "let" blocks

  # before do
    # @boggy = Bog.create!(name: "Boggy", ph: 5.6, radioactive: false)
    # @boggerson = Bog.create!(name: "Boggerson", ph: 5.7, radioactive: false)
    # @bogington = Bog.create!(name: "Bogington", ph: 4.6, radioactive: true)
  # end

  let!(:boggy) { Bog.create!(name: "Boggy", ph: 5.6, radioactive: false) }
  let!(:boggerson) { Bog.create!(name: "Boggerson", ph: 5.7, radioactive: false) }
  let!(:bogington) { Bog.create!(name: "Bogington", ph: 4.6, radioactive: true) }

  # You need to go here for every test.
  # Breaking it into a "before" dries up your code.
  before { visit '/bogs' }

  it 'displays name of all bogs' do
    # visit '/bogs'

    expect(page).to have_content(boggy.name)
    expect(page).to have_content(boggerson.name)
    expect(page).to have_content(bogington.name)
  end
end
