require 'rails_helper'


describe Product do

		context "when the product has comments" do

			let(:product) { Product.create(name: "Self Nero Mahdi") }
			let(:user) { User.create(first_name: "Nermin", last_name: "Mahdi", email: "user@gmail.com", password: "test1234") }

			before do
		  		product.comments.create!(rating: 1, user: user, body: "Awful lotion!")
		  		product.comments.create!(rating: 3, user: user, body: "Ok lotion!")
		  		product.comments.create!(rating: 5, user: user, body: "Great tanning product! Absolutely loving it!")
			end
			end


		context "A product without a description" do
			let(:product) {Product.new(description: "Good product") }

			it "is not valid without a name" do
				expect(Product.new(description: "bad product")).not_to be_valid
			end
		end
end

