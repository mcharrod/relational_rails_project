require 'rails_helper'

RSpec.describe 'frogs of one bog' do
  before do
    @h_bog = Bog.create!(name: "Hopsville", ph: 3.5, radioactive: true)

    @hoppy = @h_bog.frogs.create!(name: "Hoppy", age: 4, singing: true)
    @hip_hop = @h_bog.frogs.create!(name: "Hip Hop", age: 5, singing: false)
    @hopperson = @h_bog.frogs.create!(name: "Hopperson", age: 3, singing: true)

    @k_bog = Bog.create!(name: "Bog of K frogs", ph: 4.7, radioactive: false)

    @kermit = @k_bog.frogs.create!(name: "Kermit", age: 45, singing: true)
  end

  it 'lists all frogs associated with one bog and their information' do
    # the frogs of h bog have names that start with h
    visit "/bogs/#{@h_bog.id}/frogs"

    expect(page).to have_content(@hoppy.name)
    expect(page).to have_content(@hoppy.age)
    expect(page).to have_content(@hoppy.singing)

    expect(page).to have_content(@hip_hop.name)
    expect(page).to have_content(@hip_hop.age)
    expect(page).to have_content(@hip_hop.singing)

    expect(page).to have_content(@hopperson.name)
    expect(page).to have_content(@hopperson.age)
    expect(page).to have_content(@hopperson.singing)
  end

  it 'does not display frogs of a different bog' do
    # the frogs of k bog have names that start with k
    visit "bogs/#{@h_bog.id}/frogs"
    
    expect(page).not_to have_content(@kermit.name)
  end
end