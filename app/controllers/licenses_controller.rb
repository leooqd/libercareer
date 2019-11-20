class LicensesController < ApplicationController

	before_action :set_license, only: [:show, :edit, :update, :destroy]

	def index
		@q = License.ransack(params[:q])
		@licenses = @q.result
		filter_by_modalities if params.dig(:q, :modalities_ids)
	end

	def edit
	end

	def update
		@license.update(license_params)
		respond_to do |format|
			format.js
		end
	end

	def new
		@license = License.new
	end

	def create
		@license = License.new(license_params)
		if @license.save
			redirect_to edit_license_path(@license), notice: "#{@license.number} criado com sucesso!"
		else
			respond_to do |format|
				format.js
			end
		end
	end

	def destroy
	end

	private
	def filter_by_modalities
		array = params[:q][:modalities_ids]&.reject!(&:blank?)
		@licenses = @licenses.where("modalities_ids @> ARRAY[?]::integer[]", array) if array.present?
	end

	def set_license
		@license = License.find(params[:id])
	end

	def license_params
		params.require(:license).permit(:number, :expiration, :person_id, {modalities_ids: []})
	end
end
