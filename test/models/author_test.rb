require 'test_helper'
require 'spec_helper'
#require_relative "../author_test.rb"

class AuthorTest < ActiveSupport::TestCase
  
 Rspec.describe Author do
  		it "should require a name" do
  		Author.new(:name => "Verma").should be_valid
end
  	


end