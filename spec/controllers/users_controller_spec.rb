
require 'rails_helper'

describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end


 
  context 'No user is logged in' do
   it 'redirects to login' do
     get :show, params: { id: @user.id }
     expect(response).to redirect_to(new_user_session_path)
   end
 end

 context 'User cannot see other user page' do
   before do
    sign_in @user2
  end


end
end
