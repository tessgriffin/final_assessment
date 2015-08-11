require 'rails_helper'

feature 'user can edit a task' do

  it "lets user edit a task" do
    list = List.create!(title: "Daily Stuff")
    task = Task.create!(title: "Stuff",
                        start_date: Date.today,
                        due_date: Date.tomorrow,
                        list_id: list.id)
    visit list_path(list.id)

    click_on "Edit"

    expect(page).to have_content("Edit Task")
    fill_in 'Title', with: 'Walk the Dog'
    click_on "Update Task"

    expect(page).to have_content("Walk the Dog")
  end

  it "user cannot add task with invalid fields" do
    list = List.create!(title: "Daily Stuff")
    task = Task.create!(title: "Stuff",
                        start_date: Date.today,
                        due_date: Date.tomorrow,
                        list_id: list.id)
    visit list_path(list.id)

    click_on "Edit"

    expect(page).to have_content("Edit Task")
    fill_in 'Title', with: ''
    click_on "Update Task"

    expect(page).not_to have_content("Walk the Dog")
  end
end