require 'rails_helper'

RSpec.describe 'bog delete', type: :feature do
  before do
    @moss = Bog.create!(name: "Mossy Oaks", ph: 5.0, radioactive: false)
    @glow = Bog.create!(name: "Glowing Peats", ph: 1.9, radioactive: true)
    @neon = Bog.create!(name: "Neon waters", ph: 2.8, radioactive: true)
    @boggy = Bog.create!(name: "Boggywood", ph: 4.8, radioactive: false)

  end

  it 'deletes a bog and stays on bog index page' do
    visit '/bogs'
    expect(page).to have_content(@moss.name)

    within "#bog_#{@moss.id}" do
      click_button "Delete this bog"
    end

    expect(current_path).to eq('/bogs')
    expect(page).not_to have_content(@moss.name)
  end

  it 'deletes all frogs in the bog when deleted' do
    glitchy_frog = @neon.frogs.create!(name: "I should not display", age: 0, singing: true)
    saved = @boggy.frogs.create!(name: "I should display", age: 5, singing: true)

    visit '/bogs'

    # glitchy frog belongs to neon bog
    within "#bog_#{@neon.id}" do
      click_button "Delete this bog"
    end

    expect(current_path).to eq('/bogs')

    visit '/frogs'

    expect(page).not_to have_content(glitchy_frog.name)
    expect(page).to have_content(saved.name)
  end
end
