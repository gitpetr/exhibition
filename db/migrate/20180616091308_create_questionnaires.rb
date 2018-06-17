class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.string :title
      t.text :exhibition
      t.string :username
      t.string :address
      t.string :phone
      t.string :email
      t.string :web
      t.decimal :budget
      t.decimal :area
      t.string :region
      t.text :main_purpose_participation
      t.text :company_info
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
