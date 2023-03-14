class AccountsController < ApplicationController
    def index
        @accounts = Account.all
    end

    def show
        @account = Account.find_by_id(params[:id])
    end

    def verfied_account
        @accounts=User.where(verified: false)
    end
    
end
