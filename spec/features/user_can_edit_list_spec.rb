require 'rails_helper'

feature 'edit list' do
  it "lets user edit list with valid title" do
    list = List.create!(title: "Daily Tasks", description: "A super list")
    expect(List.count).to eq(1)
    visit lists_path

    click_on "Edit List"

    expect(page).to have_content("Edit List")
    fill_in 'Title', with: 'Super'
    fill_in 'Description', with: 'Wowowowwow'
    click_on "Update List"

    list = List.first
    expect(List.count).to eq(1)
    expect(list.title).to eq "Super"
  end
end