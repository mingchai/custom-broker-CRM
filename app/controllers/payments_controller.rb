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
        description: "Charge for policy with ID: #{@policy.policy_number}"
      )

      @policy.update(stripe_charge_id: charge.id)

      message = "Hi, #{client.first_name}! A payment of $#{@policy.annual_premium} was made for policy #'#{@policy.policy_number}' under your account. Please login to your account to see full details."
      TwilioTextMessenger.new(message).text_client

      respond_to do |format|
        format.html{redirect_to client_path(client), notice:"Policy premium paid!"}
      end
      
    rescue => error
        logger.error error.full_message
        respond_to do |format|
          format.html{render :new, notice:"Something went wrong, please try again or contact us"}
        end
    end

  end
end
