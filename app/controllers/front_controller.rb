class FrontController < ApplicationController
  def index
    @questionnaires = Questionnaire.new
    @tenders = Tender.all
  end
end
