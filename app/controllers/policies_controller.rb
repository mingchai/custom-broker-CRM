class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show, :edit, :update, :destroy]

  # GET /policies
  # GET /policies.json
  def index
    @policies = Policy.all
  end

  # GET /policies/1
  # GET /policies/1.json
  def show
  end

  # GET /policies/new
  def new
    @client = Client.find params[:client_id]
    @policy = Policy.new
  end

  # GET /policies/1/edit
  def edit
    @client = Client.find params[:client_id]
  end

  # POST /policies
  # POST /policies.json
  def create
    @client = Client.find params[:client_id]
    @policy = Policy.new(policy_params)
    @policy.client_id = @client.id

    respond_to do |format|
      if @policy.save
        # message = "Hi, #{@client.first_name}! A policy with policy # '#{@policy.policy_number}' was created under your account."
        # TwilioTextMessenger.new(message).call
        # redirect_to client_path(@client)
        format.html { redirect_to new_policy_payment_path(@policy), notice: 'Policy setup complete. Awaiting payment.' }
        format.json { render :show, status: :created, location: @policy }
      else
        format.html { render :new }
        format.json { render json: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policies/1
  # PATCH/PUT /policies/1.json
  def update
    respond_to do |format|
      if @policy.update(policy_params)
        message = "Hi, #{@policy.client.first_name}! Policy number '#{@policy.policy_number}' was recently updated. Please login to your account to see full details."

        TwilioTextMessenger.new(message).text_client

        format.html { redirect_to client_path(@policy.client), notice: 'Policy was successfully updated.'}
        format.json { render :show, status: :ok, location: @policy }
      else
        format.html { render :edit }
        format.json { render json: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policies/1
  # DELETE /policies/1.json
  def destroy
    @policy.destroy
    message = "Policy number '#{@policy.policy_number}' was removed from your account. Please login to your account to see full details."
    phone_number = @policy.client.phone_number
    
    TwilioTextMessenger.new(message, phone_number).text_client

    respond_to do |format|
      format.html { redirect_to client_url(@policy.client_id), notice: 'Policy was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_policy
      @policy = Policy.find(params[:id])
    end

    def policy_params
      params.fetch(:policy, {}).permit(:policy_number, :annual_premium, :start_date)
    end
end
