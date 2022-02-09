require 'rails_helper'

RSpec.describe 'frog delete' do
  before do
    @boggy = Bog.create!(name: "Boggywood", ph: 4.8, radioactive: false)

    @zack = @boggy.frogs.create!(name: "Zack Effrog", age: 30, singing: true)
    @jr = @boggy.frogs.create!(name: "Ribbit Downey Jr", age: 50, singing: true)
  end

  it 'deletes a frog' do
    visit '/frogs'

    expect(page).to have_content(@jr.name)
    expect(page).to have_content(@zack.name)

    visit "/frogs/#{@jr.id}"
    click_button("Delete this frog")

    expect(current_path).to eq('/frogs')
    expect(page).not_to have_content(@jr.name)
  end
end
