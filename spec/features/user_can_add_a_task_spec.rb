require 'rails_helper'

feature 'add new task' do

  it "lets user add task with valid fields" do
    list = List.create!(title: "Daily Stuff")
    expect(List.count).to eq(1)
    visit list_path(list.id)

    click_on "New Task"

    expect(page).to have_content("New Task")
    fill_in 'Title', with: 'Walk the Dog'
    fill_in 'Start date', with: '08/11/2015'
    fill_in 'Due date', with: '08/12/2015'
    click_on "Create Task"

    expect(page).to have_content("Walk the Dog")
  end

  it "user cannot add task with invalid fields" do
    list = List.create!(title: "Daily Stuff")
    expect(List.count).to eq(1)
    visit list_path(list.id)

    click_on "New Task"

    expect(page).to have_content("New Task")
    fill_in 'Title', with: ''
    fill_in 'Start date', with: '08/08/2014'
    fill_in 'Due date', with: '08/09/2014'
    click_on "Create Task"

    expect(page).not_to have_content("Walk the Dog")
  end
end