class TendersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_model, only: %i[show edit update destroy]
  before_action :load_user

  def index
    @tender = @user.tenders.all
  end

  def show; end

  def new
    @tender = Tender.new
  end

  def create
    @questionnaire = @user.questionnaire
    @tender = @user.tenders.build
    @tender.full_tender(@questionnaire)
    if @tender.save
      redirect_to tenders_path, notice: 'Тендер успешно создан'
    else
      flash[:alert] = 'Не удалось создать тендер'
      render :new
    end
  end

  def edit; end

  def update
    if @tender.update tender_params
      redirect_to tender_path, notice: 'Тендер успешно обновлен'
    else
      flash[:alert] = 'Не удалось обновить тендер'
      render :edit
    end
  end

  def destroy
    @tender.destroy
    redirect_to tenders_path , notice: "Тендер удален"
  end

  private

  def tender_params
    params.require(:tender).permit(:title, :budget, :area, :floor, :region, :exhibition, :offer_counter, :message_count, :obligatory_condition, :technical_specification, :user_id)
  end

  def load_model
    @tender = Tender.find params[:id]
  end

  def load_user
    @user = current_user
  end
end
