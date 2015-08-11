require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { List.create!(title: "Daily Tasks", description: "A super list")}
  
  it "is a valid list" do 
    expect(list).to be_valid
  end

  it "is invalid without a title" do 
    list.title = ""

    expect(list).not_to be_valid
  end
end
