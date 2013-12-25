module Api
  class ClientsController < BaseController
    before_filter :find_clients, :only => :index
    before_filter :build_client, :only => :create
    load_resource :only => [:show, :update, :destroy]
    authorize_resource

    def index
      respond_with @clients
    end

    def show
      respond_with @client
    end


    def create
      if @client.save
        render json: @client, status: :created
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end

    def update
      if @client.update_attributes(client_params)
        render json: @client
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @client.destroy

      render json: :no_content
    end

    private

    def client_params
      params.require(:client).permit(:street_address_1,
        :street_address_2,
        :city,
        :state,
        :zip,
        :special_instructions,
        :first_name,
        :last_name,
        :phone_number)
    end

    def find_clients
      if params[:ids]
        @clients = Client.find(params[:ids])
      else
        @clients = Client.all
      end
    end

    def build_client
      @client = Client.new(client_params)
    end

  end

end