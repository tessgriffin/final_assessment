require 'rails_helper'

feature 'delete list' do
  it "lets user delete list" do
    list = List.create!(title: "Daily Tasks", description: "A super list")
    task = Task.create!(title: "Walk Dog", list_id: list.id)
    expect(List.count).to eq(1)
    expect(Task.count).to eq(1)
    visit lists_path

    click_on "Delete List"

    expect(List.count).to eq(0)
    expect(Task.count).to eq(0)
  end
end