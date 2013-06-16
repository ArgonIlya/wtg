# -*- coding: utf-8 -*-
class GirlsController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy, :show, :new]


  def play
  	offset = rand(Girl.count)
	  @girl = Girl.first(:offset => offset)
    if @girl
      offset = rand(@girl.photos.count)

      @photo = @girl.photos.first(:offset => offset)
      session[:photo_offset] = offset
    end
  end

  def click
  	@girl = Girl.find(params[:id])
    @win = false
  	if ((@girl.actress == false && params[:type] == 'false') || (@girl.actress == true && params[:type] == 'true'))
      if signed_in?
        new_right = current_user.right + 1;        
        current_user.update_attribute(:right, new_right)
      end
      @girl.update_attribute(:right, @girl.right + 1)
      @win = true
      @answer_float = (@girl.right * 100 / (@girl.right + @girl.wrong))
      respond_to do |format|
        format.html { redirect_to :action => :answer, :id => @girl.id, :win => "true" }
        format.js
      end
      
  	else
      if signed_in?
        new_wrong = current_user.wrong + 1;        
        current_user.update_attribute(:wrong, new_wrong)
      end
      @girl.update_attribute(:wrong, @girl.wrong + 1)
      @win = false
      @answer_float = (@girl.right * 100 / (@girl.right + @girl.wrong))
      respond_to do |format|
        format.html { redirect_to :action => :answer, :id => @girl.id, :win => "false" }
        format.js 
      end
  	end
  end

  def answer
    @girl = Girl.find(params[:id])
    if params[:win] == "true" 
      @win = true 
    else 
      @win = false 
    end
    @answer_float = (@girl.right * 100 / (@girl.right + @girl.wrong))
    @photo = @girl.photos.first(:offset => session[:photo_offset])
  end


  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
