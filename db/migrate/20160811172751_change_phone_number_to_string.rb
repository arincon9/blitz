class ChangePhoneNumberToString < ActiveRecord::Migration[5.0]
  def change
		change_column :messages, :phone_number, :string
  end
end
