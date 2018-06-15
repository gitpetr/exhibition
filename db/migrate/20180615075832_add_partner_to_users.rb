class AddPartnerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :partner, :string, default: nil
  end
end
