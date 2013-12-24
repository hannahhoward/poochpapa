require 'spec_helper'

describe Api::ClientsController do
  let(:user) { Fabricate(:admin) }
  let(:client) { Fabricate(:client) }
  before { user; client } # initialize it

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

      it 'wraps around clients' do should include 'clients' end

      it 'returns http 200' do
        response.response_code.should == 200
      end
    end
  end

  describe 'GET show' do
    context 'unauthorized' do
      before { get :show, id: client.id }

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'authorized as admin' do
      before do
        user.ensure_authentication_token!
        get :show, id: client.id, auth_token: user.authentication_token
      end
      subject { JSON.parse response.body }

      it 'wraps around client' do should include 'client' end
      context 'inside client' do
        subject { JSON.parse(response.body)['client'] }
        it { should include 'id' }
        it { should include 'street_address_1' }
        it { should include 'street_address_2' }
        it { should include 'city' }
        it { should include 'state' }
        it { should include 'zip' }
        it { should include 'special_instructions' }
        it { should include 'first_name' }
        it { should include 'last_name' }
        it { should include 'phone_number' }
        it { should include 'user_id' }
        it { should include 'pet_ids' }
      end

      it 'returns http 200' do
        response.response_code.should == 200
      end
    end
  end

  describe 'POST create' do
    let :client_params do
      {
        :street_address_1 => '123 Fake St.',
        :city => 'Los Angeles',
        :state => 'CA',
        :zip => '12345',
        :special_instructions => 'Break in',
        :first_name => 'Bob',
        :last_name => 'Smith',
        :phone_number => '123-456-7890'
      }
    end

    context 'unauthorized' do
      before { post :create, :client => client_params}

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'authorized as admin' do
      before :each do
        user.ensure_authentication_token!
      end

      context 'with valid_data' do
        it "should create a project" do
          expect do
            post :create, client: client_params, auth_token: user.authentication_token
          end.to change{Client.count}.by(1)
        end

        context 'response' do
          before do
            post :create, client: client_params, auth_token: user.authentication_token
          end

          it 'returns http 201' do
            response.response_code.should == 201
          end

          subject { JSON.parse response.body }
          it 'wraps around client' do should include 'client' end
          context 'inside client' do
            subject { JSON.parse(response.body)['client'] }
            it { should include 'id' }
            it { should include 'street_address_1' }
            it { should include 'street_address_2' }
            it { should include 'city' }
            it { should include 'state' }
            it { should include 'zip' }
            it { should include 'special_instructions' }
            it { should include 'first_name' }
            it { should include 'last_name' }
            it { should include 'phone_number' }
            it { should include 'user_id' }
            it { should include 'pet_ids' }
          end
        end
      end

      context 'with invalid data' do
        let :client_params do
          {
            :first_name => nil
          }
        end

        it "should not create a project" do
          expect do
            post :create, client: client_params, auth_token: user.authentication_token
          end.to_not change{Client.count}.by(1)
        end

        it 'returns unprocessable_entity' do
          post :create, client: client_params, auth_token: user.authentication_token
          response.response_code.should == 422
        end
      end

    end
  end

  describe 'PUT update' do
    let :client_params do
      {
        :first_name => "New Name"
      }
    end

    context 'unauthorized' do
      before { put :update, :id => client.id, :client => client_params }

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'with valid request token for admin' do
      before do
        user.ensure_authentication_token!
        put :update, :id => client.id, :client => client_params, auth_token: user.authentication_token
      end

      context 'with valid_data' do
        it "should update the project" do
          client.reload.first_name.should == "New Name"
        end

        it 'returns http 200' do
          response.response_code.should == 200
        end

        subject { JSON.parse response.body }
        it 'wraps around client' do should include 'client' end
        context 'inside client' do
          subject { JSON.parse(response.body)['client'] }
          it { should include 'id' }
          it { should include 'street_address_1' }
          it { should include 'street_address_2' }
          it { should include 'city' }
          it { should include 'state' }
          it { should include 'zip' }
          it { should include 'special_instructions' }
          it { should include 'first_name' }
          it { should include 'last_name' }
          it { should include 'phone_number' }
          it { should include 'user_id' }
          it { should include 'pet_ids' }
        end
      end

      context 'with invalid data' do
        let :client_params do
          {
            :first_name => nil
          }
        end

        it 'returns unprocessable_entity' do
          response.response_code.should == 422
        end
      end

    end
  end

end