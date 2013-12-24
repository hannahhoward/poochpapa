module Api
  class UsersController < BaseController

    def index
      if params[:ids]
        @users = User.find(params[:ids])
      else
        @users = User.all
      end
      authorize! :index, @users
      respond_with @users
    end

    def show
      @user = User.find(params[:id])
      authorize! :show, @user
      respond_with @user
    end

  end
end