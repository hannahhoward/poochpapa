module Api
  class BaseController < ApplicationController
    respond_to :json
    before_action :default_json

    def current_user
      return nil unless params[:auth_token]
      User.find_by authentication_token: params[:auth_token]
    end

    protected

    rescue_from CanCan::AccessDenied do |exception|
      render json: {}, status: 401
    end

    def default_json
      request.format = :json if params[:format].nil?
    end
  end
end