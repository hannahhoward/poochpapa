module Api
  class PetsController < BaseController
    before_action :auth_only!

    def index
      if params[:ids]
        @pets = Pet.find(params[:ids])
      else
        @pets = Pet.all
      end
      respond_with @pets
    end

    def show
      @pet = Pet.find(params[:id])
      respond_with @pet
    end
  end
end