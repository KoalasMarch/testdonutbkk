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
  paginates_per 10

  validates :title, presence: true

  def as_api_json
    json = {}
    json[:id] = self.id
    json[:title] = self.title
    json[:description] = self.description
    json[:finished] = self.finished
    json
  end
end
