class Transaction < ActiveRecord::Base
     belongs_to :account
     validates_presense_of :account_id
end
