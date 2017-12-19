require 'rails_helper'

describe Comment do
   let(:product) { FactoryBot.create(:product) }
   let(:user) { FactoryBot.create(:user) }

	context "comment validations" do
		it "is new comment valid " do
			expect(FactoryBot.build(:comment, product: product, user: user, rating:'4')).to be_valid
		end  
	end  

	context "product id validations" do
		it "is not valid without a user" do
			expect(FactoryBot.build(:comment, product: product, user: nil)).not_to be_valid
		end  
	end  

	context "body validations" do
		it "is not valid without body" do 
			expect(FactoryBot.build(:comment, product: product, user: user, body:nil)).not_to be_valid
		end
	end

	context "rating validations" do
		it "is not valid without a rating" do
			expect(FactoryBot.build(:comment, product: product, user: user, rating:nil)).not_to be_valid
		end
	end

	context "rating type validations" do
		it "is not valid if a user doesn't use an integer" do
			expect(FactoryBot.build(:comment, product: product, user: user, rating:"xyz")).not_to be_valid
		end
	end

end

