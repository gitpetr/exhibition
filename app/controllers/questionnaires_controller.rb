class QuestionnairesController < ApplicationController
  before_action :load_model, only: %i[show edit update destroy]

  def index
    @questionnaires = Questionnaire.all
  end

  def show; end

  def new
    @questionnaire = Questionnaire.new
  end

  def create
    @questionnaire = Questionnaire.new questionnaire_params
    @user = @questionnaire.user_create(@questionnaire.email)
    @questionnaire.user_id = @user.id

    if @questionnaire.save
      redirect_to root_path, notice: 'Анкета зарегистрирована, о результатах Вам сообщим'
    else
      flash[:alert] = 'Анкета заполнена неверно'
      redirect_to root_path
    end
  end

  def edit; end

  def update
    if @questionnaire.update questionnaire_params
      redirect_to admin_questionnaires_path, notice: 'Анкета успешно обновлена'
    else
      flash[:error] = 'Не удалось обновить анкету'
      render :edit
    end
  end

  def destroy
    @questionnaire.destroy
    redirect_to admin_questionnaires_path , notice: "Анкета удалена"
  end

  private

  def questionnaire_params
    params.require(:questionnaire).permit(:title, :exhibition, :username, :address, :phone, :email, :web, :budget, :area, :region, :main_purpose_participation, :obligatory_condition, :technical_specification, :company_info, :floor, :user_id)
  end

  def load_model
    @questionnaire = Questionnaire.find params[:id]
  end
end
