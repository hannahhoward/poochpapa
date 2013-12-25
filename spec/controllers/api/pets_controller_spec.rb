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
        it { should include 'client_id'}
        it { should include 'param' }
      end

      it 'returns http 200' do
        response.response_code.should == 200
      end
    end
  end


  describe 'POST create' do
    let :pet_params do
      {
        :name => 'Cheesey',
        :age => 5,
        :animal_type => 'Cat',
        :breed => 'Sphinx',
        :medical_history => 'Breathing issues',
        :special_needs => 'chese',
        :instructions => 'Give me cheese'
      }
    end

    context 'unauthorized' do
      before { post :create, :pet => pet_params}

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
            post :create, pet: pet_params, auth_token: user.authentication_token
          end.to change{Pet.count}.by(1)
        end

        context 'response' do
          before do
            post :create, pet: pet_params, auth_token: user.authentication_token
          end

          it 'returns http 201' do
            response.response_code.should == 201
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
            it { should include 'client_id'}
            it { should include 'param' }
          end
        end
      end

      context 'with invalid data' do
        let :pet_params do
          {
            :first_name => nil
          }
        end

        it "should not create a project" do
          expect do
            post :create, pet: pet_params, auth_token: user.authentication_token
          end.to_not change{Pet.count}.by(1)
        end

        it 'returns unprocessable_entity' do
          post :create, pet: pet_params, auth_token: user.authentication_token
          response.response_code.should == 422
        end
      end

    end
  end

  describe 'PUT update' do
    let :pet_params do
      {
        :name => "New Name"
      }
    end

    context 'unauthorized' do
      before { put :update, :id => pet.id, :pet => pet_params }

      it 'returns http 401' do
        response.response_code.should == 401
      end
    end

    context 'with valid request token for admin' do
      before do
        user.ensure_authentication_token!
        put :update, :id => pet.id, :pet => pet_params, auth_token: user.authentication_token
      end

      context 'with valid_data' do
        it "should update the project" do
          pet.reload.name.should == "New Name"
        end

        it 'returns http 200' do
          response.response_code.should == 200
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
          it { should include 'client_id'}
          it { should include 'param' }
        end
      end

      context 'with invalid data' do
        let :pet_params do
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