# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many :active_posts, -> { where("expires_on > ?", Date.current) }, class_name: "Post", foreign_key: "board_id", primary_key: "id"
  has_many :expired_posts, -> { where("expires_on <= ?", Date.current) }, class_name: "Post", foreign_key: "board_id", primary_key: "id"
end
