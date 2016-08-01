# == Schema Information
#
# Table name: d_items
#
#  id          :integer          not null, primary key
#  propuest_id :integer
#  item_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DItem < ApplicationRecord
  belongs_to :propuest
  belongs_to :item
end
