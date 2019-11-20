# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy set_preferred]

  def index
    @q = Person.ransack(params[:q])
    @people = @q.result
    filter_by_modalities if params.dig(:q, :license, :modalities_ids)
  end

  def edit
    @person.build_license if @person.license.blank?
  end

  def set_preferred
    if @person.set_preferred!(params[:phone_id])
      redirect_to request.referrer, notice: 'Atualizado com sucesso!'
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

  def destroy; end

  private

  def filter_by_modalities
    array = params[:q][:license][:modalities_ids]&.reject!(&:blank?)
    if array.present?
      @people = @people.where(id: License.where('modalities_ids @> ARRAY[?]::integer[]', array).select(&:person_id))
     end
  end

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :last_name, :document, :email, :birth_date, :preferred_phone_id,
                                   phones_attributes: %i[id number ddd kind person_id _destroy],
                                   license_attributes: [:id, :number, :expiration, :person_id, { modalities_ids: [] }])
  end
end
