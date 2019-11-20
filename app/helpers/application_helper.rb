# frozen_string_literal: true

module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def custom_date(date)
    l date.to_date, format: :default
  rescue StandardError
    date
  end

  def person_license_valid(person)
    if person.blank? || person.license.blank? || person.license.expired?
      "<i class='material-icons red-text f20'>close</i>".html_safe
    else
      "<i class='material-icons green-text f20'>check</i>".html_safe
    end
  rescue StandardError
    "<i class='material-icons red-text f20'>close</i>".html_safe
  end

  def status(rent)
    if rent.return_date.present?
      "<i class='green-text'>Finalizado</i>".html_safe
    elsif rent.pickup_date.blank? && (Date.today < rent.end_date)
      "<i class='blue-text'>Aguardando retirada</i>".html_safe
    elsif rent.pickup_date.blank? && (Date.today > rent.end_date)
      "<i class='red-text'>Pedido Vencido</i>".html_safe
    elsif Date.today > rent.end_date
      "<i class='red-text'>#{pluralize((Date.today - rent.end_date).to_i, 'dia atrasado', 'dias atrasados')}</i>".html_safe
    else
      "<i class='orange-text'>Em Andamento</i>".html_safe
    end
  rescue StandardError
  end
end
