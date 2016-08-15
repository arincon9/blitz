class CreateAddColumnPromoodeToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :promo_code, :string
  end
end
