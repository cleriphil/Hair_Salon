require('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to adding a stylists', {:type => :feature}) do
  it('allows a user to add a stylist') do
    visit('/')
    click_link('Stylists')
    click_link('Add a Stylist')
    fill_in('name', :with => 'Hera')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end
end

describe('path to viewing stylists after adding stylists', {:type => :feature}) do
  it('allows a user to view a list of stylists') do
    visit('/stylists/new')
    fill_in('name', :with => 'Hera')
    click_button('Add Stylist')
    visit('/stylists')
    expect(page).to have_content('Hera')
  end
end

describe('path to adding a client to a stylist', {:type => :feature}) do
  it('allows a user to add a client to a stylist') do
    
  end
end
