require 'rails_helper'


describe UsersController, type: :controller do

    #let!(:user1) { User.create(email: 'toma@example.com', password: '1234567890') }
    #let!(:user2) { User.create(email: 'paolo@example.com', password: '1234567890') }
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
    end


  describe 'GET #show' do

     context 'when user is logged in' do
      #@user = FactoryBot.build(:user)
      before do
        sign_in @user1
      end

      it 'loads correct user details' do
          get :show, params: { id: @user1.id }
          expect(response.status).to eq 200
          expect(assigns(:user)).to eq @user1
        end

      it 'does not load second user page' do
          get :show, params: { id: @user2.id }
          expect { raise "You are not authorized to access this page." }.to raise_error(RuntimeError)
      end

     end

     context 'when a user is not logged in' do
       it 'redirects to login' do
         get :show, params: { id: @user1.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
  end

end
