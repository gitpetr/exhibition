class AddObligatoryConditionToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :obligatory_condition, :text
  end
end
