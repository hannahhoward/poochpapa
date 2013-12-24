module Api
  class ClientsController < BaseController
    def index
      if params[:ids]
        @clients = Client.find(params[:ids])
      else
        @clients = Client.all
      end
      authorize! :index, @clients
      respond_with @clients
    end

    def show
      @client = Client.find(params[:id])
      authorize! :show, @client
      respond_with @client
    end


    def create
      @client = Client.new(client_params)

      authorize! :create, @client

      if @client.save
        render json: @client, status: :created
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end

    def update
      @client = Client.find(params[:id])


      authorize! :update, @client

      if @client.update_attributes(client_params)
        render json: @client
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @client = Client.find(params[:id])
      authorize! :destroy, @client
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


  end

end