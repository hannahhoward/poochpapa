module Api
  class UsersController < BaseController
    before_filter :find_users, :only => :index
    load_resource :only => [:show]
    authorize_resource

    def index
      respond_with @users
    end

    def show
      respond_with @user
    end

    private

    def find_users
      if params[:ids]
        @users = User.find(params[:ids])
      else
        @users = User.all
      end
    end

  end
end