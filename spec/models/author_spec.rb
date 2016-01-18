require 'rails_helper'

RSpec.describe Author, type: :model do

	let(:author){ create(:author, name: "madhan")}
  
  it "should be a valid author" do
  	location = build(:author, name: "madhan")

  	expect(location).to be_valid
  end
  it "should not be blank" do
  	location = build(:author, name: nil)

  	expect(location).not_to be_valid
  end

  it "should have minimum 3 characters" do
  	location = build(:author, name: "ma")

  	expect(location).not_to be_valid
  end
    
end






  
 



