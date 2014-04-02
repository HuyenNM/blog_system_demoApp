class LayoutPagesController < ApplicationController
  def home
  	@entry = current_user.entrys.build if signed_in?
  	
    if signed_in?
      @entry_items = current_user.feed.paginate(page: params[:page])
    else
      @entry_items = Entry.paginate(page: params[:page])
    end
  end

  def help
  end

    def about
  end

    def contact
  end
end
