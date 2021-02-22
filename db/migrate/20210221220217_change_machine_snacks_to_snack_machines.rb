class ChangeMachineSnacksToSnackMachines < ActiveRecord::Migration[5.1]
  def change
    rename_table :machine_snacks, :snack_machines
  end
end
