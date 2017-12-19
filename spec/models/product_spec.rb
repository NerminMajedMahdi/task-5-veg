require 'rails_helper'
describe Product do 

  context 'when the product has comments' do
   let(:product) { FactoryBot.create(:product) }
   let(:user) { FactoryBot.create(:user) }

   before do
    product.comments.create!(rating: 1, user: user, body: "Not good enough")
    product.comments.create!(rating: 3, user: user, body: "Ok product!")
    product.comments.create!(rating: 5, user: user, body: "So Nice product!")
  end
  
  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
  end

 
 it "has highest rated comment" do
   expect(product.highest_rating_comment.rating).to eq 5
 end

end

context "name validations" do
  it "is not valid without name" do
   expect(FactoryBot.build(:product, name: nil)).not_to be_valid
 end  
end  

context "description validations" do
  it "is not valid without description" do
   expect(FactoryBot.build(:product, description: nil)).not_to be_valid
 end  
end  

context "image url validations" do
  it "is not valid without image url" do
   expect(FactoryBot.build(:product, image_url: nil)).not_to be_valid
 end  
end  

context "colour validations" do
  it "is not valid without colour" do
   expect(FactoryBot.build(:product, colour: nil)).not_to be_valid
 end  
end  
end  

