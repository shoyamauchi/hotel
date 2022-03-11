class HotelappsController < ApplicationController
  def top #ルーム一覧
    @hotelapps = Hotelapp.all
  end

  def index #myルーム一覧
    @hotelapps = current_user.hotelapps
  end

  def show #myルーム詳細
    @hotelapps = Hotelapp.find(params[:id])
  end

  def new
    @hotelapps = Hotelapp.new
  end

  def create
    hotelapp = current_user.hotelapps.new(hotelapp_params)
    hotelapp.save!
    redirect_to hotelapps_url, notice: "ホテル「#{hotelapp.name}」を登録しました。"
  end

  def edit
    @hotelapp = current_user.hotelapps.find(params[:id])
  end

  def update
    hotelapp = current_user.hotelapps.find(params[:id])
    hotelapp.update!(hotelapp_params)
    redirect_to hotelapps_url, notice: "ホテル「#{hotelapp.name}」を更新しました。"
  end

  def destroy
    hotelapp = current_user.hotelapps.find(params[:id])
    hotelapp.destroy
    redirect_to hotelapps_url, notice: "ホテル「#{hotelapp.name}」を削除しました。"
  end

  def hotelapp_params
    params.require(:hotelapp).permit(:id, :name, :intro, :price, :address)
  end
end
