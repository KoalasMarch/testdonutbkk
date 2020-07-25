# == Schema Information
#
# Table name: todos
#
#  id          :bigint           not null, primary key
#  description :text
#  finished    :boolean
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Todo < ApplicationRecord
end
