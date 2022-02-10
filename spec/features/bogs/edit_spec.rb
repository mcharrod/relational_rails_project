require 'rails_helper'

RSpec.describe 'update the bog' do
  before do
    @log = Bog.find_or_create_by!(name: "The log lodge", ph: 5.7, radioactive: false)
  end

  it 'has a link to update the bog' do
    visit "/bogs/#{@log.id}"

    click_button("Update this bog")
    expect(current_path).to eq("/bogs/#{@log.id}/edit")
  end

  it 'has a form to update the bog information' do
    visit "/bogs/#{@log.id}"

    # this is our old name
    expect(page).to have_content("The log lodge")

    click_button("Update this bog")
    # this is our new name
    fill_in("Bog name", with: "The loggy lodge")
    click_button "Save"

    expect(current_path).to eq("/bogs/#{@log.id}")
    # we want loggy, not log.
    expect(page).to have_content("The loggy lodge")
    expect(page).not_to have_content("The log lodge")
  end
end
