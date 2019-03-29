class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email params[:email]
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:primary] = "Welcome, #{user.first_name}!"
            redirect_to clients_path
        else
            respond_to do |format|
                format.html{render :new, notice: "Email or Password is incorrect"}
            end
        end
    end

    def destroy
        session[:user_id] = nil
        respond_to do |format|
            format.html{redirect_to new_session_path :new, notice: "Logged Out"}
        end
    end
end
