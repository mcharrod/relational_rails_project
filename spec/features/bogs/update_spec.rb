require 'rails_helper'

RSpec.describe 'update the bog' do
  before do
    @log = Bog.find_or_create_by!(name: "The log lodge", ph: 5.7, radioactive: false)
  end

  it 'has a link to update the bog' do
    visit "/bogs/#{@log.id}"

    click_link("Update this bog")
    expect(current_path).to eq("/bogs/#{@log.id}/edit")
  end
end
