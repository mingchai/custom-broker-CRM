class PaymentsController < ApplicationController
  def new
    @policy = Policy.find params[:policy_id]
  end

  def create
    # render json: params
    @policy = Policy.find params[:policy_id]
    client = @policy.client
    begin
      charge = Stripe::Charge.create(
        amount: (@policy.annual_premium * 100).to_i,
        currency: "cad",
        source: params[:stripe_token],
        description: "Charge for Gift with ID: #{@policy.id}"
      )

      @policy.update(stripe_charge_id: charge.id)

      message = "Hi, #{client.first_name}! A payment of $#{@policy.annual_premium} was made for policy #'#{@policy.policy_number}' under your account. Please login to your account to see full details."
      TwilioTextMessenger.new(message).call

      respond_to do |format|
        format.html{redirect_to client_path(client), notice:"Policy premium paid!"}
      end
      
    rescue => error
        logger.error error.full_message
        flash.now[:danger] = "Something went wrong, please try again or contact us"
        render :new
    end

  end
end
