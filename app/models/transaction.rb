class Transaction < ActiveRecord::Base
     belongs_to :account
     validates_presence_of :account_id
     validates :transaction_no , :amount, :transaction_type, :presence => true
end
