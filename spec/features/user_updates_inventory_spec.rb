require 'spec_helper'

feature 'user updates inventory' do
  let!(:item) { FactoryGirl.create(:food_item) }
  scenario 'user can see inventory on home page' do
    visit food_items_path
    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to have_content item.inventory
  end

  scenario 'user updates inventory for a specific item' do
    visit food_items_path
    expect(page).to have_content item.title
    click_on item.title
    fill_in 'Inventory', with: 90
    click_on 'Update Food item'
    expect(page).to have_content '90'
  end

  scenario 'user updates inventory for a specific item' do
    visit food_items_path
    expect(page).to have_content item.title
    click_on item.title
    fill_in 'Inventory', with: 'yellow'
    click_on 'Update Food item'
    expect(page).to have_content 'Inventoryis not a number'
  end
end
