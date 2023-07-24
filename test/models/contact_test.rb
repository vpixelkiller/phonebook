# frozen_string_literal: true

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'should save contact with valid attributes' do
    contact = Contact.new(name: 'John', surname: 'Doe', phone: 123456789)
    assert contact.save, 'Failed to save the contact with valid attributes'
  end

  test 'should been added a new contact to the database with valid attributes' do
    contact = Contact.new(name: 'John', surname: 'Doe', phone: 123456789)

    assert_difference('Contact.count') do
      contact.save!
    end
  end

  test 'should not save contact without name' do
    contact = Contact.new(surname: 'Doe', phone: 123456789)
    initial_count = Contact.count

    assert_not contact.valid?
    contact.save

    assert_includes contact.errors[:name], "can't be blank"
    assert_not contact.persisted?

    assert_equal initial_count, Contact.count
  end

  test 'should not save contact without surname' do
    contact = Contact.new(name: 'John', phone: 123456789)
    initial_count = Contact.count

    assert_not contact.valid?
    contact.save

    assert_includes contact.errors[:surname], "can't be blank"
    assert_not contact.persisted?

    assert_equal initial_count, Contact.count
  end

  test 'should not save contact without phone' do
    contact = Contact.new(name: 'John', surname: 'Doe')
    initial_count = Contact.count

    assert_not contact.valid?
    contact.save

    assert_includes contact.errors[:phone], 'Should be a 9-digit number'
    assert_not contact.persisted?

    assert_equal initial_count, Contact.count
  end
end
