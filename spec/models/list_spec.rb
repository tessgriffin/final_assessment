require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { List.create!(title: "Daily Tasks", description: "A super list")}
  let(:task) { Task.create!(title: "Walk the dog",
                            notes: "Django is a goober",
                            start_date: Date.today,
                            due_date: Date.tomorrow)}
  
  it "is a valid list" do 
    expect(list).to be_valid
  end

  it "is invalid without a title" do 
    list.title = ""

    expect(list).not_to be_valid
  end

  it "has many tasks" do 
    list.tasks << task
    expect(list.tasks.first.title).to eq("Walk the dog")
  end
end
