class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all.order(created_at: :desc)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @policies = @client.policies.order(created_at: :desc)
    @firehalls = FireHall.all

    @firehall_near = []
    @firehall_close = []
    @firehall_far = []

    @firehalls.each do |hall|
      if hall.distance_to([@client.latitude, @client.longitude], :km) < 2.5
        @firehall_near << hall
      elsif hall.distance_to([@client.latitude, @client.longitude], :km) >= 2.5 && hall.distance_to([@client.latitude, @client.longitude], :km) < 5
        @firehall_close << hall
      elsif hall.distance_to([@client.latitude, @client.longitude], :km) >= 5
        @firehall_far << hall
      end
    end
    
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
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
