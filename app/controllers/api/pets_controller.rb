module Api
  class PetsController < BaseController
    before_filter :find_pets, :only => :index
    before_filter :build_pet, :only => :create
    load_resource :only => [:show, :update, :destroy]
    authorize_resource

    def index
      respond_with @pets
    end

    def show
      respond_with @pet
    end

    def create
      if @pet.save
        render json: @pet, status: :created
      else
        render json: @pet.errors, status: :unprocessable_entity
      end
    end

    def update
      if @pet.update_attributes(pet_params)
        render json: @pet
      else
        render json: @pet.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @pet.destroy

      render json: :no_content
    end

    private

    def find_pets
      if params[:ids]
        @pets = Pet.find(params[:ids])
      else
        @pets = Pet.all
      end
    end

    def build_pet
      @pet = Pet.new(pet_params)
    end

    def pet_params
      params.require(:pet).permit(
          :name,
          :age,
          :animal_type,
          :breed,
          :medical_history,
          :special_needs,
          :instructions,
          :client_id)
    end

  end
end