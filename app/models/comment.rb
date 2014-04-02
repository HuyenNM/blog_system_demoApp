class Comment < ActiveRecord::Base
	belongs_to :entry
	belongs_to :user
	validates :contend, presence: true
	default_scope -> { order('created_at DESC')}
end
