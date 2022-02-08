require 'rails_helper'

RSpec.describe "update frog" do
  before do
    @boggy = Bog.find_or_create_by!(name: "Boggywood", ph: 4.8, radioactive: false)

    @zack = @boggy.frogs.create!(name: "Zack Effrog", age: 30, singing: true)
  end

  it 'frog show page has a link to the update page' do
    visit "/frogs/#{@zack.id}"
    save_and_open_page

    click_button("Update this frog")
    expect(current_path).to eq("/frogs/#{@zack.id}/edit")
    # expect(page).to have_content("thing")
  end

  it 'updates the frog information' do
    visit "/frogs/#{@zack.id}"

    expect(page).to have_content("Zack Effrog")

    click_button("Update this frog")
    fill_in("Frog name", with: "Zack Attack")
    click_button("Save")

    expect(current_path).to eq("/frogs/#{@zack.id}")
    expect(page).not_to have_content("Zack Effrog")
    expect(page).to have_content("Zack Attack")
  end
end
