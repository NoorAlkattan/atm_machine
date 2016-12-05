class AddAtmMachineToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :atm_machine_id, :integer
  end
end
