class Account < ActiveRecord::Base
    belongs_to :user
    has_many :transactions
    #validates_presence_of :user_id
    attr_accessor :amount
    validates :balance, :numericality => { greater_than_or_equal_to: 0 }
    validates :account_no, :balance, :presence => true
    
    def deposit (amt)
      if amt[:amount].to_f < 0.0 || limit_daily_deposit?(amt[:amount])
        msg= "error"
    else
        self.balance = self.balance.to_f + amt[:amount].to_f
        self.save
        transactions.create!(amount: amt[:amount], transaction_type: 1)
        msg = "done!"
   end
     msg
end

private

def limit_daily_deposit?(current_amount)
    amounts_list = self.transactions.today.where(transaction_type: 1).pluck(:amount)
    sum = amounts_list.map(&:to_f).reduce(:+)
    new_balance_today = sum.to_f + current_amount.to_f
    if new_balance_today > 1000
        return true
    else
        false
    end
    
end
end