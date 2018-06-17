class CreateTenders < ActiveRecord::Migration[5.2]
  def change
    create_table :tenders do |t|
      t.string :title
      t.decimal :budget
      t.decimal :area
      t.integer :floor
      t.string :region
      t.string :exhibition
      t.integer :offer_counter # Счетчик предложений
      t.integer :message_count # Счетчик сообщений
      t.text :obligatory_condition # Обязательные условия
      t.text :technical_specification
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
