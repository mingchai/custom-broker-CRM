class Api::V1::ClientsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
        clients = Client.all
        render json: clients
    end

    def show
        render json: client
    end

    private
    def client
        @client ||= Client.find params[:id]
    end
end
