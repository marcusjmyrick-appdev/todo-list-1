# == Schema Information
#
# Table name: todoitems
#
#  id          :integer          not null, primary key
#  description :string
#  status      :string           default("Next Up")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Todoitem < ApplicationRecord
end
