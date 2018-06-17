class AddTmpPasswordToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :partner, :string
    add_column :users, :partner, :boolean
    add_column :users, :tmp_password, :string
  end
end
