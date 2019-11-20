# frozen_string_literal: true

class AutomobilesController < ApplicationController
  before_action :set_automobile, only: %i[show edit update destroy]

  def index
    @q = Automobile.ransack(params[:q])
    @automobiles = @q.result
  end

  def edit; end

  def update
    @automobile.update(automobile_params)
    respond_to do |format|
      format.js
    end
  end

  def new
    @automobile = Automobile.new
  end

  def create
    @automobile = Automobile.new(automobile_params)
    if @automobile.save
      redirect_to edit_automobile_path(@automobile), notice: "#{@automobile.model} (#{@automobile.license_plate}) criado com sucesso!"
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy; end

  private

  def set_automobile
    @automobile = Automobile.find(params[:id])
  end

  def automobile_params
    params.require(:automobile).permit(:color, :model, :year, :license_plate, :kind, :cost)
  end
end
