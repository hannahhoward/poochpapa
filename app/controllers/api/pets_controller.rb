module Api
  class PetsController < BaseController

    def index
      if params[:ids]
        @pets = Pet.find(params[:ids])
      else
        @pets = Pet.all
      end
      authorize! :index, @pets
      respond_with @pets
    end

    def show
      @pet = Pet.find(params[:id])
      authorize! :show, @pet
      respond_with @pet
    end

    def create
      @pet = Pet.new(pet_params)

      authorize! :create, @pet

      if @pet.save
        render json: @pet, status: :created
      else
        render json: @pet.errors, status: :unprocessable_entity
      end
    end

    def update
      @pet = Pet.find(params[:id])


      authorize! :update, @pet

      if @pet.update_attributes(pet_params)
        render json: @pet
      else
        render json: @pet.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @pet = Pet.find(params[:id])
      authorize! :destroy, @pet
      @pet.destroy

      render json: :no_content
    end

    private

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