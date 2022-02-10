require 'rails_helper'

RSpec.describe 'bog creation' do
  it 'link navigates to the bog creation page from bog index' do
    visit '/bogs'
    click_link 'Create a new bog'

    expect(current_path).to eq('/bogs/new')
  end

  it 'has a form' do
    visit '/bogs/new'
    
    expect(page).to have_field("Bog name")
    expect(page).to have_field("Bog ph")
  end

  it 'creates a new bog' do
    visit '/bogs/new'

    fill_in("Bog name", with: "Froggy School")
    fill_in("Bog ph", with: 5.7)

    select "false", :from => "radioactive"
    click_button("Save")

    expect(current_path).to eq('/bogs')
    expect(page).to have_content("Froggy School")
  end
end
