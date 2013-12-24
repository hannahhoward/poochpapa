require 'spec_helper'

describe Api::PetsController do
  let(:user) { Fabricate(:admin_user) }
  let(:pet) { Fabricate(:pet) }
  before { user; pet } # initialize it

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

      it 'wraps around pets' do should include 'pets' end

      it 'returns http 200' do
        response.response_code.should == 200
      end
    end
  end

  describe 'GET show' do
    context 'unauthorized' do
      before { get :show, id: pet.id }

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'authorized as admin' do
      before do
        user.ensure_authentication_token!
        get :show, id: pet.id, auth_token: user.authentication_token
      end
      subject { JSON.parse response.body }

      it 'wraps around pet' do should include 'pet' end
      context 'inside pet' do
        subject { JSON.parse(response.body)['pet'] }
        it { should include 'id' }
        it { should include 'name' }
        it { should include 'age' }
        it { should include 'animal_type' }
        it { should include 'breed' }
        it { should include 'medical_history' }
        it { should include 'special_needs' }
        it { should include 'instructions' }
        it { should include 'param' }
      end

      it 'returns http 200' do
        response.response_code.should == 200
      end
    end
  end

end