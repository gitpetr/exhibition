class Tender < ApplicationRecord
  belongs_to :user

  def full_tender(questionnaire)
    self.title = questionnaire.title
    self.budget = questionnaire.budget
    self.area = questionnaire.area
    self.floor = questionnaire.floor
    self.region = questionnaire.region
    self.obligatory_condition = questionnaire.obligatory_condition
    self.technical_specification = questionnaire.technical_specification
  end

end
