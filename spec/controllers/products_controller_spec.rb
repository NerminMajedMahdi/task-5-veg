require 'rails_helper'


describe ProductsController, type: :controller do

  context "GET #index:" do
    it "renders products index template" do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context "GET #show:" do
    let(:product) { FactoryBot.create(:product) }
    it "renders products show template" do
      get :show, params: { id: product.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  context "GET #new:" do
    let(:product) { FactoryBot.create(:product) }
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:admin) }

    it "user login - can not add new products" do
      sign_in user
      get :new
      expect(flash[:alert]).to eq('You are not authorized to access this page.')
      expect(response).to redirect_to root_url
    end

    it "admin login - can add new products" do
      sign_in admin
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end

  context "POST #create:" do
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:admin) }

    it "admin login - can create new product" do
      sign_in admin
      post :create, params: {product: {name:"Dining Set", description:'description', price_in_cents:'55', colour:'pink',image_url:'yy'}}
      expect(response).to redirect_to product_path(Product.last.id)
    end
  end

  context "GET #edit" do
    let(:product) { FactoryBot.create(:product) }
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:admin) }

    it "admin login - can edit products" do
      sign_in admin
      get :edit, params: {id: product.id} 
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end

    it "user login - can not edit products" do
      sign_in user
      get :edit, params: {id: product.id} 
      expect(flash[:alert]).to eq('You are not authorized to access this page.')
      expect(response).to redirect_to root_url
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

  context "DELETE #destroy:" do
    let(:product) { FactoryBot.create(:product) }
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:admin) }

    it "user login - can not delete products" do
      sign_in user
      delete :destroy, params: { id: product.id }
      expect(flash[:alert]).to eq('You are not authorized to access this page.')
      expect(response).to redirect_to root_url
    end

    it "admin login - can delete products" do
      sign_in admin
      delete :destroy, params: {id: product.id}
      flash[:notice].should eql("Product was successfully destroyed.")
      expect(response).to redirect_to products_path
    end
  end

end
