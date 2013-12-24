require 'spec_helper'

describe Api::ClientsController do
  let(:user) { Fabricate(:user) }
  let(:client) { Fabricate(:client) }
  before { user; client } # initialize it

  describe 'GET index' do
    context 'unauthorized' do
      before { get :index }

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'authorized' do
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

    context 'authorized' do
      before do
        user.ensure_authentication_token!
        get :show, id: client.id, auth_token: user.authentication_token
      end
      subject { JSON.parse response.body }

      it 'wraps around pet' do should include 'pet' end
      context 'inside pet' do
        subject { JSON.parse(response.body)['pet'] }
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
      end

      it 'returns http 200' do
        response.response_code.should == 200
      end
    end
  end

  describe 'POST create' do
    let :client_params do
      {
        :project => {
            :street_address_1 => '123 Fake St.',
            :city => 'Los Angeles'
            :state => 'CA'
            :zip => '12345'
            :special_instructions => 'Break in'
            :first_name => 'Bob',
            :last_name => 'Smith',
            :phone_number => '123-456-7890'
        }
      }.as_json
    end

    context 'unauthorized' do
      before { post :create, client_params }

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'with request token for non-admin user' do
      before do
        add_token_for(user).to(@request)
        post :create, project_params
      end

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'with valid request token for admin' do
      before do
        add_token_for(admin).to(@request)
      end

      context 'with valid_data' do
        it "should create a project" do
          expect do
            post :create, project_params
          end.to change{Project.count}.by(1)
        end

        it 'returns http 201' do
          post :create, project_params
          response.response_code.should == 201
        end

        it 'sets location to resource url' do
          post :create, project_params
          response.headers['Location'].should == api_v1_project_path(Project.last)
        end

        it 'should return valid JSON API' do
          post :create, project_params
          response.body.should be_valid_json_api
        end

        it 'should include projects' do
          post :create, project_params
          JSON::Api.parse(response.body).should include 'projects'
        end
      end

      context 'with invalid data' do
        let :project_params do
          {:project => {} }
        end

        it "should not create a project" do
          expect do
            post :create, project_params
          end.to_not change{Project.count}.by(1)
        end

        it 'returns unprocessable_entity' do
          post :create, project_params
          response.response_code.should == 422
        end
      end

    end
  end

  describe 'PUT update' do
    let :project_params do
      {
        :name => "New Name"
      }
    end

    context 'unauthorized' do
      before { put :update, :id => project.id, :project => project_params }

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'with request token for non-admin user' do
      before do
        add_token_for(user).to(@request)
        put :update, :id => project.id, :projects => project_params
      end

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'with valid request token for admin' do
      before do
        add_token_for(admin).to(@request)
        put :update, :id => project.id, :project => project_params
      end

      context 'with valid_data' do
        it "should update the project" do
          project.reload.name.should == "New Name"
        end

        it 'returns http 200' do
          response.response_code.should == 200
        end

        it 'sets location to resource url' do
          response.headers['Location'].should == api_v1_project_path(project)
        end

        it 'should return valid JSON API' do
          response.body.should be_valid_json_api
        end

        it 'should include projects' do
          JSON::Api.parse(response.body).should include 'projects'
        end

      end

      context 'with invalid data' do
        let :project_params do
          {
            :name => nil
          }
        end

        it 'returns unprocessable_entity' do
          response.response_code.should == 422
        end
      end

    end
  end

end