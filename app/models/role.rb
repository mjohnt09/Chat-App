# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  user_role  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord

  has_many  :users, { :dependent => :nullify }
  
end
