class HotelappsController < ApplicationController
  before_action :search
  before_action :authenticate_user!, except: [:top, :search, :show]

  def search
    @search = Hotelapp.ransack(params[:q])
    @hotelapps = @search.result
    @q = Hotelapp.ransack(params[:q]) # params[:q]のqには検索フォームに入力した値が入る
    @hotelapps = @q.result(distinct: true) 
  end

  def top #ルーム一覧
    # 検索オブジェクト
    @search = Hotelapp.ransack(params[:q])
    # 検索結果
    @hotelapps = @search.result
    @hotelapps = @q.result(distinct: true) # distinct: trueは重複したデータを除外
    # @hotelapps = Hotelapp.all
  end

  def index #myルーム一覧
    @hotelapps = current_user.hotelapps
  end

  def show #myルーム詳細
    @hotelapps = Hotelapp.find(params[:id])
  end

  def new
    @hotelapp = Hotelapp.new
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

  private

  def hotelapp_params
    params.require(:hotelapp).permit(:id, :name, :intro, :price, :address,).merge(user_id: current_user.id)
  end
end
