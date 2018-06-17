class AddTechnicalSpecificationToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :technical_specification, :text
  end
end
