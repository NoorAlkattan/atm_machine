class Account < ActiveRecord::Base
    belongs_to :user
    has_many :transactions, dependent: :destroy
    #validates_presence_of :user_id
    attr_accessor :amount
    #validates :balance, :numericality => { greater_than_or_equal_to: 0 }
    # validates :account_no, :balance, :presence => true
    
    def deposit (amt)
      if amt[:amount].to_f <= 0.0 || limit_daily_deposit?(amt[:amount])
        errors.add(:amount, "please enter amount")
        return false
      else
        self.balance = self.balance.to_f + amt[:amount].to_f
        self.save
        return true
      end
    end

  def withdrawal (amt)
      if amt[:amount].to_f <= 0.0 || max_withdrawal?(amt[:amount])
        errors.add(:amount, "please enter amount")
        return false
    else
        self.balance = self.balance.to_f - amt[:amount].to_f
        self.save
        return true
      end
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

    
 def max_withdrawal?(current_amount)
    amounts_list = self.transactions.today.where(transaction_type: 2).pluck(:amount)
    sum = amounts_list.map(&:to_f).reduce(:+)
    new_balance_today =  current_amount.to_f + sum.to_f 
    if new_balance_today > 500
        return true
    else
        false
    end
end
end
