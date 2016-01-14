# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  role            :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "can have role USER"  do
    user = users(:spiderman)
    user.role = 'USER'
    user.password = 'test123'
    user.password_confirmation = 'test123'
    assert user.save, "Could not save user with role USER"
  end

  test "can have role ADMIN" do
    user = users(:spiderman)
    user.role = 'ADMIN'
    user.password = 'test123'
    user.password_confirmation = 'test123'
    assert user.save, "Could not save user with role ADMIN"
  end

  test "should not have role ADMINISTRATOR" do
    user = users(:spiderman)
    user.role = 'ADMINISTRATOR'
    user.password = 'test123'
    user.password_confirmation = 'test123'
    assert_not user.save, "Could save user with role ADMINISTRATOR"
  end

  test "should not save with blank role" do
    user = users(:spiderman)
    user.role = ''
    user.password = 'test123'
    user.password_confirmation = 'test123'
    assert_not user.save, "Could save user with blank role"
  end

  test "should not save with nil role" do
    user = users(:spiderman)
    user.role = nil
    user.password = 'test123'
    user.password_confirmation = 'test123'
    assert_not user.save, "Could save user with nil role"
  end


end
