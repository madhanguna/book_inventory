require 'rails_helper'

RSpec.describe Publisher, type: :model do

	let(:publisher){ create(:publisher, name: "madhan")}
  
  it "should be a valid author" do
  	location = build(:publisher, name: "madhan")

  	expect(location).to be_valid
  end
  it "should not be blank" do
  	location = build(:publisher, name: nil)

  	expect(location).not_to be_valid
  end

  it "should have minimum 3 characters" do
  	location = build(:publisher, name: "ma")

  	expect(location).not_to be_valid
  end
    
end






  
 



