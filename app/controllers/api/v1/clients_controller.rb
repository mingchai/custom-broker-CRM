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
         render json:{first_name: client.first_name,
         last_name: client.last_name,
         phone_number: client.phone_number,
         email: client.email,
         street_address: client.street_address,
         city: client.city,
         province: client.province,
         postal_code: client.postal_code,
         marketing_consent: client.marketing_consent,
         user_id: client.user_id }
      else
        render json: {errors: client.errors, status: 422 }
      end
    end

    def destroy
      client.destroy
      render json:{status: 200}, status: 200
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
