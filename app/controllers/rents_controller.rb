class RentsController < ApplicationController

  before_action :authenticate_user!

  def index
    @rents = current_user.rents
  end

  def show #ルーム詳細
    @rent = Rent.find(params[:id])
    @hotelapp = Hotelapp.find_by(id: params[:hotelapp_id])
    @hotelapp = Hotelapp.find_by(params[:room_name])
  end

  def new
    @rent = Rent.new
    @hotelapp = Hotelapp.find(params[:hotelapp_id])
    @rent.hotelapp_id = @hotelapp.id #(hotelapp_params[:hotelapp]) 
  end

  #def confirm #予約確認
    #@rent = Rent.new(rent_params)
    #render :new unless @rent.invalid?
  #end

  def create
    #binding.pry
    @rent = Rent.new(rent_params)
    @hotelapp = Hotelapp.find(params[:rent][:hotelapp_id])
    @rent.hotelapp_id = @hotelapp.id
    #binding.pry
    if @rent.save
      redirect_to @rent, notice: "予約を完了しました。"
    else
      render :new
    end
    #if params[:back].present? #戻るボタン
      #render :new and return
    #end
  end

  private
    def rent_params
      params.require(:rent).permit(:id, :start_date, :end_date, :number, :hotelapp_id).merge(user_id: current_user.id)
    end
    
    def hotelapp_params
      params.require(:hotelapp).permit(:id, :name, :intro, :price, :address,).merge(user_id: current_user.id)
    end
  
end
