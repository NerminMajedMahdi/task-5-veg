require 'rails_helper'


describe ProductsController, type: :controller do

  context "GET #index:" do
    it "renders products index template" do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end



  context "PUT #update" do
    let(:product) { FactoryBot.create(:product) }
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:admin) }

    it "admin login - can update products" do
      sign_in admin
      patch :update, params: {id: product.id, product: {name: 'set', price_in_cents: 434, image_url: "", description: "", colour:'red'}}
      expect(response).to be_ok
    end
  end

 

end
