# == Schema Information
#
# Table name: clientes
#
#  id         :integer          not null, primary key
#  nombre     :string
#  correo     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cliente < ApplicationRecord
end
