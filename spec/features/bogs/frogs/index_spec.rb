require 'rails_helper'

RSpec.describe 'frogs of one bog' do
  before do
    @h_bog = Bog.create!(name: "Hopsville", ph: 3.5, radioactive: true)

    @hoppy = @h_bog.frogs.create!(name: "Hoppy", age: 4, singing: true)
    @hip_hop = @h_bog.frogs.create!(name: "Hip Hop", age: 5, singing: true)
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
RSpec.describe 'one bogs frogs index' do
  before do
    @bog = Bog.create!(name: "Bog", ph: 4.7, radioactive: false)
    @zack = @bog.frogs.create!(name: "Zack Effrog", age: 30, singing: true)
    @jr = @bog.frogs.create!(name: "Ribbit Downey Jr", age: 50, singing: false)
    @demi = @bog.frogs.create!(name: "Demi Lovatoad", age: 30, singing: true)
    @danny = @bog.frogs.create!(name: "Danny Devitoad", age: 30, singing: false)
  end

  it 'sorts frogs alphabetically by name' do
    visit "/bogs/#{@bog.id}/frogs"

    expect(@danny.name).to appear_before(@demi.name)
    expect(@demi.name).to appear_before(@jr.name)
    expect(@jr.name).to appear_before(@zack.name)
  end

  it 'has a link to create a new frog' do
    visit "/bogs/#{@bog.id}/frogs"

    click_link("Drop a frog in this bog")
    expect(current_path).to eq("/bogs/#{@bog.id}/frogs/new")
  end

  it 'frog in a bog page has a form to create new frog' do
    visit "/bogs/#{@bog.id}/frogs/new"

    fill_in("Frog name", with: "New Frog from spec")
    fill_in("Frog age", with: "30")
    select "true", :from => "singing"
    click_button("Save")

    expect(current_path).to eq("/bogs/#{@bog.id}/frogs")
    expect(page).to have_content("New Frog from spec")
    expect(page).to have_content("30")
    expect(page).to have_content("Singing on a log? true")
  end
end
