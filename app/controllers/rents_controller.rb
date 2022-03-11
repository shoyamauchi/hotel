class RentsController < ApplicationController

  def index
    @hotelapps = Hotelapp.all
    @rents = Rent.all
  end

  def show #ルーム詳細
    @hotelapp = Hotelapp.find_by(id: params[:id])
  end

  def new
    @rent = Rent.new
    @hotelapp = Hotelapp.find_by(id: params[:id])
  end

  #def confirm #予約確認
    #@rent = Rent.new(rent_params)
    #render :new unless @rent.invalid?
  #end

  def create
    @rent = Rent.new(rent_params)
    
    if @rent.save
      redirect_to @rent, notice: "予約を完了しました。"
    else
      render :new
    end
    #if params[:back].present? #戻るボタン
      #render :new and return
    #end
  end

  def rent_params
    params.require(:rent).permit(:start, :end, :number, :hotelapp_id)
  end

  def hotelapp_params
    params.require(:rent).permit(hotelapp:[:id, :name, :intro, :price, :address])
  end
end
