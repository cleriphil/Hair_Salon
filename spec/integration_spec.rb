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
    visit('/stylists/new')
    fill_in('name', :with => 'Hera')
    click_button('Add Stylist')
    visit('/stylists')
    click_link('Hera')
    click_link('Add a Client')
    fill_in('name', :with => 'St. Sebastian')
    click_button('Add Client')
    expect(page).to have_content('Success')
  end
end

describe('path to viewing a the clients of a stylist', {:type => :feature}) do
  it('allows a user to view the clients of a stylist') do
    visit('/stylists/new')
    fill_in('name', :with => 'Hera')
    click_button('Add Stylist')
    visit('/stylists')
    click_link('Hera')
    click_link('Add a Client')
    fill_in('name', :with => 'St. Sebastian')
    click_button('Add Client')
    visit('/stylists')
    click_link('Hera')
    expect(page).to have_content('St. Sebastian')
  end
end

describe('path for updating the name of a stylist', {:type => :feature}) do
  it('allows a user to update the name of a stylist') do
    visit('/stylists/new')
    fill_in('name', :with => 'Hera')
    click_button('Add Stylist')
    visit('/stylists')
    click_link('Hera')
    click_link("Edit Hera")
    fill_in('name', :with => 'Herald')
    click_button('Edit Stylist')
    expect(page).to have_content("Herald's Clients")
  end
end

describe('path for updating the name of a client', {:type => :feature}) do
  it('allows a user to edit the name of a client') do
    visit('/stylists/new')
    fill_in('name', :with => 'Hera')
    click_button('Add Stylist')
    visit('/stylists')
    click_link('Hera')
    click_link('Add a Client')
    fill_in('name', :with => 'St. Sebastian')
    click_button('Add Client')
    visit('/stylists')
    click_link('Hera')
    click_link('St. Sebastian')
    click_link('Edit Client')
    fill_in('name', :with => 'Sal')
    click_button('Edit Client')
    expect(page).to have_content("Sal")
  end
end

describe('path for deleting a stylist', {:type => :feature}) do
  it('allows a user to delete a stylist') do
    visit('/stylists/new')
    fill_in('name', :with => 'Hera')
    click_button('Add Stylist')
    visit('/stylists')
    click_link('Hera')
    click_link('Edit Hera')
    click_button('Delete Stylist')
    expect(page).to have_no_content('Hera')
  end
end

describe('path for deleting a client', {:type => :feature}) do
  it('allows a user to delete a client') do
    visit('/stylists/new')
    fill_in('name', :with => 'Hera')
    click_button('Add Stylist')
    visit('/stylists')
    click_link('Hera')
    click_link('Add a Client')
    fill_in('name', :with => 'St. Sebastian')
    click_button('Add Client')
    visit('/stylists')
    click_link('Hera')
    click_link('St. Sebastian')
    click_link('Edit Client')
    click_button('Delete Client')
    visit('/stylists')
    click_link('Hera')
    expect(page).to have_no_content('St. Sebastian')
  end
end
