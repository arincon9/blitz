class CreateAddColumnBundleToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :bundle, :string
  end
end
