# frozen_string_literal: true

class Contact < ApplicationRecord
  validate :name_presence
  validate :surname_presence

  validates :phone, format: { with: /\A\d{9}\z/, message: I18n.t('should_be_phone') }

  private

  def name_presence
    errors.add(:name, "can't be blank") if name.blank?
  end

  def surname_presence
    errors.add(:surname, "can't be blank") if surname.blank?
  end
end
