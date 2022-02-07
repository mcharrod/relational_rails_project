require 'rails_helper'

RSpec.describe 'frog show page', type: :feature do
  before do
    @bog = Bog.create!(name: "Just a bog", ph: 5.6, radioactive: false)

    @tony = @bog.frogs.create!(name: "Anthony Hopkins", age: 15, singing: false)
  end

  it 'displays all data for one frog' do
    visit "/frogs/#{@tony.id}"

    expect(page).to have_content("Meet this one particular frog, #{@tony.name}!")
    expect(page).to have_content(@tony.age)
    expect(page).to have_content(@tony.singing)
  end
end
