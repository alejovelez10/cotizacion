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

class Propuest < ApplicationRecord
  belongs_to :cliente
  has_many :d_items
end
