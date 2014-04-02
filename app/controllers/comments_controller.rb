class CommentsController < ApplicationController
  before_action :correct_user , only: :destroy
  before_action :signed_in_user, only: [:create, :destroy]

def new     

      @entry_item = Entry.find(params[:entry_id])
      @comment_items = @entry_item.comments
      @comment = @entry_item.comments.build 
end

def index
end

  def create
  	#@comment = current_user.comments.build(:contend => params[:contend], :entry_id => params[:entry_id])   
    #@comment = Comment.new(:contend => params[:contend], :user_id => current_user.id, :entry_id => params[:entry_id])
   # binding.pry
        #@comment = current_user.comments.build(:contend => params[:contend], :entry_id => params[:entry_id])   

    #@comment = current_user.entrys.find_by(:id => params[:entry_id]).comments.build(:contend => params[:contend])
    @comment = Comment.new(:contend => params[:comment][:contend],:user_id => current_user.id, :entry_id => params[:comment][:entry_id])
  	#binding.pry
    if @comment.save
  		redirect_to newComment_url(:entry_id => params[:comment][:entry_id])
      #redirect_to root_url
  	else         
  		 #render 'layout_pages/home'
       redirect_to newComment_url(:entry_id => params[:comment][:entry_id])
  	end
  end

  def destroy
    @comment.destroy   
    #Comment.find(params[:id]).destroy
    redirect_to newComment_url(:entry_id => @comment.entry_id)
  end

    def correct_user     
      @comment = current_user.comments.find(params[:id])     
      redirect_to newComment_url(:entry_id => @comment.entry_id) if @comment.nil?
    end
    private

    def comment_params
      params.require(:comment).permit(:contend, :entry_id)
    end
end
