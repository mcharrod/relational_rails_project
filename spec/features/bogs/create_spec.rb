require 'rails_helper'

RSpec.describe 'create bog page' do
  it 'has a form' do
    visit '/bogs/new'
    expect(page).to have_field("Bog name")
    expect(page).to have_field("Bog ph")
  end

  # pending: authentication token issue, will only sometimes create new bog
  it 'creates a new bog' do
    visit '/bogs/new'

    fill_in("Bog name", with: "Froggy School")
    fill_in("Bog ph", with: 5.7)
    find('#dropdown_list', :text => 'false').click
    click_button("Save")

    expect(current_path).to eq('/bogs')
    expect(page).to have_content("Froggy School")
  end
end
