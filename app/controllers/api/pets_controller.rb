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
  end
end