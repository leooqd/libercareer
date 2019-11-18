class AutomobilesController < ApplicationController

	before_action :set_automobile, only: [:show, :edit, :update, :destroy]

	def index
		conditions = []
		conditions << "UPPER(unaccent(automobiles.model)) LIKE '%#{I18n.transliterate(params[:model].upcase)}%'" unless params[:model].blank?
		conditions << "UPPER(unaccent(automobiles.kind)) LIKE '%#{I18n.transliterate(params[:kind].upcase)}%'" unless params[:kind].blank?
		conditions << "UPPER(unaccent(automobiles.color)) LIKE '%#{I18n.transliterate(params[:color].upcase)}%'" unless params[:color].blank?
		conditions << "UPPER(unaccent(automobiles.license_plate)) LIKE '%#{I18n.transliterate(params[:license_plate].upcase)}%'" unless params[:license_plate].blank?
		conditions << "(automobiles.cost BETWEEN #{params[:min]} AND #{params[:max]})" unless params[:min].blank? or params[:max].blank? 
		conditions << "automobiles.id = #{params[:codigo]}" unless params[:codigo].blank?
		@automobiles = Automobile.where(conditions.join(" AND ")).ordered
	end

	def edit
	end

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

	def destroy
	end

	private

	def set_automobile
		@automobile = Automobile.find(params[:id])
	end

	def automobile_params
		params.require(:automobile).permit(:color, :model, :year, :license_plate, :kind, :cost)
	end


end
