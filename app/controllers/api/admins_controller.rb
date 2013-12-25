module Api
  class AdminsController < BaseController
    before_filter :find_admins, :only => :index
    load_resource :only => [:show]
    authorize_resource

    def index
      respond_with @admins
    end

    def show
      respond_with @admin
    end

    private

    def find_admins
      if params[:ids]
        @admins = Admin.find(params[:ids])
      else
        @admins = Admin.all
      end
    end

  end
end