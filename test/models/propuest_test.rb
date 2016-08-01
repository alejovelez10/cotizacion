# == Schema Information
#
# Table name: propuests
#
#  id          :integer          not null, primary key
#  descripcion :text
#  cliente_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PropuestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
