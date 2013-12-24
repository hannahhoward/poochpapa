require 'spec_helper'

describe Api::AdminsController do
  let(:user) { Fabricate(:admin_user) }
  let(:admin) { user.role }
  before { user; admin } # initialize it

  describe 'GET index' do
    context 'unauthorized' do
      before { get :index }

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'authorized as admin' do
      before do
        user.ensure_authentication_token!
        get :index, auth_token: user.authentication_token
      end
      subject { JSON.parse response.body }

      it 'wraps around admins' do should include 'admins' end

      it 'returns http 200' do
        response.response_code.should == 200
      end
    end
  end

  describe 'GET show' do
    context 'unauthorized' do
      before { get :show, id: admin.id }

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'authorized as admin' do
      before do
        user.ensure_authentication_token!
        get :show, id: admin.id, auth_token: user.authentication_token
      end
      subject { JSON.parse response.body }

      it 'wraps around admi' do should include 'admin' end
      context 'inside admin' do
        subject { JSON.parse(response.body)['admin'] }
        it { should include 'id' }
        it { should include 'first_name' }
        it { should include 'last_name' }
        it { should include 'user_id' }
      end

      it 'returns http 200' do
        response.response_code.should == 200
      end
    end
  end

end