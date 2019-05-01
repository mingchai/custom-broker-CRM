class Api::V1::ClientsController < Api::ApplicationController
    before_action :authenticate_user!
    def index
        clients = Client.all.order(created_at: :desc)
        render json: clients
    end

    def show
        render json: client
    end

    def create
        client = Client.new(client_params)
        client.user_id = current_user.id

      if client.save!
        # will show attributes specified in the client_serializer
         render json: client
      else
        render json: {errors: client.errors, status: 422 }
      end
    end

    def destroy
      client.destroy
      render json:{status: 200}, status: 200
    end

    def call
      # render json: params
        @client = Client.find params[:client_id]
        client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
        call = client.calls.create(
          to:   @client.phone_number,
          from: ENV["TWILIO_PHONE_NUMBER"],
          url: "https://example.herokuapp.com/connect/#{ENV["TWILIO_PHONE_NUMBER"]}"
        )
    end

    private
    def client
        @client ||= Client.find params[:id]
    end

    def client_params
        params.require(:client).permit(:first_name,
        :last_name,
        :phone_number,
        :email,
        :street_address,
        :city,
        :province,
        :postal_code,
        :marketing_consent)
      end
end
