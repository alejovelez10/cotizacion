# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  nombre      :string
#  precio      :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ApplicationRecord
  belongs_to :category
end
