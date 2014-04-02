class Comment < ActiveRecord::Base
	belongs_to :entry
	belongs_to :user
	validates :contend, presence: true
	validates :user_id, presence: true
	validates :entry_id, presence: true

	default_scope -> { order('created_at DESC')}
end
