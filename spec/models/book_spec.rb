require 'rails_helper'

RSpec.describe Book, type: :model do

	let(:book){ create(:book, title: "madhan")}
  
  it "should be a valid title" do
  	location = build(:book, title: "madhan")

  	expect(location).to be_valid
  end

  it "should not be blank" do
  	location = build(:book, title: nil)

  	expect(location).not_to be_valid
  end

  it "should have maximum 10 characters" do
  	location = build(:book, title: "maqwertyuiiii")

  	expect(location).not_to be_valid
  end


  it "should be digits" do
    location = build(:book, price: "maqwertyuiiii")

    expect(location).not_to be_valid
  end

   it " price should not be blank" do
    location = build(:book, price: nil)

    expect(location).not_to be_valid
  end


  it "should have minimum 10 characters" do
    location = build(:book, isbn: "1kn11")

    expect(location).not_to be_valid
  end

  it " isbn should not be blank" do
    location = build(:book, isbn: nil)

    expect(location).not_to be_valid
  end
    




end






  
 



