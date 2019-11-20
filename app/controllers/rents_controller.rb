# frozen_string_literal: true

class RentsController < ApplicationController
  before_action :set_rent, only: %i[show edit update destroy pickup_car return_car]

  def index
    @q = Rent.ransack(params[:q])
    @rents = @q.result
  end

  def edit; end

  def pickup_car
    @rent.pickup!
  end

  def return_car
    @rent.return!
  end

  def calculate_cost
    get_cost(params[:start_date].to_date, params[:end_date].to_date, Automobile.find(params[:automobile_id]).cost)
  end

  def update
    @rent.update(rent_params)
    respond_to do |format|
      format.js
    end
  end

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    if @rent.save
      redirect_to edit_rent_path(@rent), notice: "Locação #{@rent.automobile.license_plate} #{@rent.person.full_name} criado com sucesso!"
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy; end

  private

  def get_cost(start_date, end_date, cost)
    days = end_date - start_date
    @cost = cost * days
  rescue Exception => e
  end

  def set_rent
    @rent = Rent.find(params[:id])
  end

  def rent_params
    params.require(:rent).permit(:person_id, :automobile_id, :cost, :start_date, :end_date, :pickup_date, :delivery_date)
  end
end
