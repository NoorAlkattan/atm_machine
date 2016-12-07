class Transaction < ActiveRecord::Base
     belongs_to :account
     belongs_to :atm_machine
     validates_presence_of :account_id
     #validates :transaction_no , :amount, :transaction_type, :presence => true
     scope :today, -> { where('date(created_at) = ?', Date.today)}
    default_scope  { order(:created_at => :desc) }
    
    def self.to_csv
         CSV.generate do |csv|
              csv << column_names
              all.each do |transaction|
                  csv << transaction.attributes.values_at(*column_names)
        end
      end
     end
  end
 