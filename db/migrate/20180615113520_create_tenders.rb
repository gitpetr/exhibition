class CreateTenders < ActiveRecord::Migration[5.2]
  def change
    create_table :tenders do |t|
      t.string :title
      t.decimal :budget
      t.decimal :area

      t.timestamps
    end
  end
end
