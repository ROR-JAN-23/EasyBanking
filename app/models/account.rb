class Account < ApplicationRecord
    belongs_to :user
    validates :user, presence: true
    validates :account_number, presence: true, uniqueness: true
    validates :balance, presence: true, numericality: true


    
    

end
