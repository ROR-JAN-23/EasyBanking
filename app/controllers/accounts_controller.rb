class AccountsController < ApplicationController
    def index
        @accounts = Account.all
    end

    def show
        @account = Account.find_by(params[:id])
    end

    def balance
        @current_account = Account.find_by(user_id: current_user.id)
        @balance=  @current_account.balance
        render inline: " Your account balance is : rs #@balance "
    end

    def debit(a,t)
        @amount= a -t
        return @amount
    end 
      

    def credit(c,d)
        @rec_balance = @rec_balance + @tamount
    end


    def transfer_money
        byebug
        @sender = Account.find_by(account_number: params[:sender_ac])
        if @sender.present?
            @amount = Account.find_by(account_number: params[:sender_ac]).balance
            @tamount = params[:amount].to_i
            if @amount >= @tamount
                @receiver = Account.find_by(account_number: params[:receiver_ac])
                @rec_balance = Account.find_by(account_number: params[:receiver_ac]).balance
                if @receiver.present?
                    debit(@amount,@tamount)
                    creit(@rec_balance,@tamount)
                    @sender.@amount.save
                    @receiver.@rec_balance.save
                else
                    render inline: "Receiver's Account does not exits!!"
                end
            else
                render inline: "You have insufficient balance, current balance is #@amount"
            end
        else
            render inline: "Sender's Account does not exits!!"
        end
    end
end
end
