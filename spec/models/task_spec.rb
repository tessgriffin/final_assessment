require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:list) { List.create!(title: "Daily Tasks", description: "A super list")}
  let(:task) { Task.create!(title: "Walk the dog",
                            notes: "Django is a goober",
                            list_id: list.id,
                            start_date: Date.today,
                            due_date: Date.tomorrow)}
  
  it "is a valid task" do 
    expect(task).to be_valid
  end

  it "is invalid without a title" do 
    task.title = ""

    expect(task).not_to be_valid
  end

  it "can mark task as completed" do 
    expect(task.complete).to eq(false)

    task.complete = true

    expect(task).to be_valid
    expect(task.complete).to eq(true)
  end

  it "can belong to a list" do 
    expect(task.list.title).to eq("Daily Tasks")
  end

  it "cannot set a start date before today" do 
    task.start_date = Date.yesterday

    expect(task).not_to be_valid
  end

  it "cannot set a due date before today" do 
    task.due_date = Date.yesterday

    expect(task).not_to be_valid
  end
end
