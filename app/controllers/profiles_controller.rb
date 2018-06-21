class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user

  def show
    @profile = @user.profile
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new profile_params
    @profile.user_id = @user.id
    if @profile.save
      redirect_to profiles_path, notice: 'Профиль успешно создан'
    else
      flash[:alert] = 'Не удалось создать профиль'
      render :new
    end
  end

  def edit
    @profile = @user.profile
  end

  def update
    if @user.profile.update profile_params
      redirect_to profiles_path, notice: 'Профиль успешно обновлен'
    else
      flash[:alert] = 'Не удалось обновить профиль'
      render :edit
    end
  end

  def destroy
    @user.profile.destroy
    redirect_to root_path , notice: "Профиль удален"
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :avatar, :phone)
  end

  def load_user
    @user = current_user
  end
end
