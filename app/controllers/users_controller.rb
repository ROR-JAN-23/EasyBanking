class UsersController < ApplicationController
    def index
        @user= User.where(verified: false)
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    def verfied_user

    params["id"]=(params[:id]).to_i
    @users=User.find(params[:id])
    @users.verified = true

    if @users.save
        @account=Account.new
        @account.user_id=@users.id
        @account.account_number=@users.id
        if @users.account_type == "saving"
            @account.balance = 0.00
        elsif @users.account_type == "current"
            @account.balance = 5000.00
        else @users.account_type == "money_market"
            @account.balance = 10000.00
        end
        
        @account.save
        render plain: "Account Verified"
    end
   end
        
end
