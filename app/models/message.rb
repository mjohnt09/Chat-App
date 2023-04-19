# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Message < ApplicationRecord

  belongs_to :sender, { :class_name => "User", :foreign_key => "user_id" }
end
