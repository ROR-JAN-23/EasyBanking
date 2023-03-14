class User < ApplicationRecord
  has_one :account
  enum :account_type, {  saving: "Saving Account",
    current: "Current Account",
    money_market: "Money Market Account" }, suffix: true

  enum :role, { user: "User",
    admin: "Admin"}, suffix: true

    after_initialize :set_default_role

    private

    def set_default_role
      self.role ||= :user
    end


    scope :check_method, ->(email) {where(:email => email)}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  # attr_accessor :deposite, :withdraw, :transfer_money, :as => :admin
end
