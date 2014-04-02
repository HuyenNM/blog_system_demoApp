module ApplicationHelper

	  def full_title(page_title)                          # Method definition
    base_title = "Ruby on Rails Blog System Demo"  # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      "#{base_title} | #{page_title}"                 # String interpolation
    end
  end	
end