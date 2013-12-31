require 'spec_helper'

feature 'user creates food item' do
  scenario 'user fills in full description' do
    visit '/'
    click_on 'Create New Item'
    fill_in 'Title', with: 'Turkey'
    fill_in 'Description', with: 'Deli Meat'
    click_on 'Create'
    expect(page).to have_content 'New item created'
  end

  scenario 'user submits blank information' do
    visit new_food_item_path
    click_on 'Create'
    expect(page).to have_content "Titlecan't be blank"
    expect(page).to have_content "Descriptioncan't be blank"
  end

  scenario "user can't submit multiple similar items" do
    visit new_food_item_path
    fill_in 'Title', with: 'Baloney'
    fill_in 'Description', with: 'Meat'
    click_on 'Create'
    visit new_food_item_path
    fill_in 'Title', with: 'Baloney'
    fill_in 'Description', with: 'More Meat'
    click_on 'Create'
    expect(page).to have_content 'Titlehas already been taken'
  end

  scenario 'food items are displayed' do
    food = FactoryGirl.create(:food_item)
    visit food_items_path
    expect(page).to have_content(food.title)
    expect(page).to have_content(food.description)
  end
end
