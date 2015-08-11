require 'rails_helper'

feature 'add new list' do

  it "lets user add list with valid fields" do
    expect(List.count).to eq(0)
    visit lists_path

    click_on "New List"

    expect(page).to have_content("New List")
    fill_in 'Title', with: 'Super'
    fill_in 'Description', with: 'Wowowowwow'
    click_on "Create List"

    list = List.first
    expect(List.count).to eq(1)
    expect(list.title).to eq "Super"
  end

  it "cannot create a list without a title" do 
    expect(List.count).to eq(0)
    visit lists_path

    click_on "New List"

    expect(page).to have_content("New List")
    fill_in 'Title', with: ''
    fill_in 'Description', with: 'Wowowowwow'
    click_on "Create List"

    expect(List.count).to eq(0)
  end
end