class PeopleController < ApplicationController

	before_action :set_person, only: [:show, :edit, :update, :destroy, :set_preferred]

	def index
		conditions = []
		conditions << "UPPER(unaccent(people.name)) LIKE '%#{I18n.transliterate(params[:name].upcase)}%'" unless params[:name].blank?
		conditions << "UPPER(unaccent(people.email)) LIKE '%#{I18n.transliterate(params[:email].upcase)}%'" unless params[:email].blank?
		conditions << "UPPER(unaccent(people.document)) LIKE '%#{I18n.transliterate(params[:document].upcase)}%'" unless params[:document].blank?
		conditions << "people.id = #{params[:codigo]}" unless params[:codigo].blank?
		@people = Person.where(conditions.join(" AND ")).ordered
	end

	def edit
		@person.build_license if @person.license.blank?
	end

	def set_preferred
		if @person.set_preferred!(params[:phone_id])
			redirect_to request.referrer, notice: "Atualizado com sucesso!"
		else
			respond_to do |format|
				format.js
			end
		end
	end

	def update
		if @person.update(person_params)
		end
		respond_to do |format|
			format.js
		end
	end

	def new
		@person = Person.new
		@person.build_license if @person.license.blank?
	end

	def create
		@person = Person.new(person_params)
		if @person.save
			redirect_to edit_person_path(@person), notice: "#{@person.name} criado com sucesso!"
		else
			respond_to do |format|
				format.js
			end
		end
	end

	def destroy
	end

	private

	def set_person
		@person = Person.find(params[:id])
	end

	def person_params
		params.require(:person).permit(:name, :last_name, :document, :email, :birth_date, :preferred_phone_id, 
			phones_attributes: [:id, :number, :ddd, :kind, :person_id, :_destroy],
			license_attributes: [:id, :number, :expiration, :person_id, {modalities_ids: []}])
	end
end