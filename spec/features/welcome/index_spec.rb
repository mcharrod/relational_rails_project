require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  it 'has a link to frog index' do
    visit '/'

    click_link("View all frogs in existence")

    expect(current_path).to eq('/frogs')
  end
end
