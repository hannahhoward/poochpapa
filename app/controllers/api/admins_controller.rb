module Api
  class AdminsController < BaseController

    def index
      if params[:ids]
        @admins = Admin.find(params[:ids])
      else
        @admins = Admin.all
      end
      authorize! :index, @admins
      respond_with @admins
    end

    def show
      @admin = Admin.find(params[:id])
      authorize! :show, @admin
      respond_with @admin
    end
  end
end