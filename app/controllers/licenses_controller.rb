class LicensesController < ApplicationController

	before_action :set_license, only: [:show, :edit, :update, :destroy]

	def index
		conditions = []
		conditions << "UPPER(unaccent(licenses.number)) LIKE '%#{I18n.transliterate(params[:number].upcase)}%'" unless params[:number].blank?
		conditions << "licenses.id = #{params[:codigo]}" unless params[:codigo].blank?
		@licenses = License.where(conditions.join(" AND ")).ordered
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

	def set_license
		@license = License.find(params[:id])
	end

	def license_params
		params.require(:license).permit(:number, :expiration, :person_id, {modalities_ids: []})
	end
end
