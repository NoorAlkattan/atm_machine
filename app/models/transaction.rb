class Transaction < ActiveRecord::Base
     belongs_to :account
     belongs_to :atm_machine
     validates_presence_of :account_id
     #validates :transaction_no , :amount, :transaction_type, :presence => true
     scope :today, -> { where('date(created_at) = ?', Date.today)}
    default_scope  { order(:created_at => :desc) }
end
