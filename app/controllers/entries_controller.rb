class EntriesController < ApplicationController
   before_action :signed_in_user, only: [:create, :destroy]
   before_action :correct_user,   only: :destroy
def index
end

  def create
  	@entry = current_user.entrys.build(entry_params)
  	if @entry.save
  		flash[:success] = "Entry save success!"
  		redirect_to root_url
  	else    
       @entry_items = []  
  		 render 'layout_pages/home'
  	end
  end

  def destroy
    #binding.pry
    @entry.destroy
    #binding.pry
    #redirect_to root_url
  end

    private

    def entry_params
      params.require(:entry).permit(:title, :body)
    end

    def correct_user
      @entry = current_user.entrys.find_by(id: params[:id])
      redirect_to root_url if @entry.nil?
    end
end
