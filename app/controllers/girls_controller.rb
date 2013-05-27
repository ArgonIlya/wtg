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
  	if ((@girl.actress == false && params[:type] == "girl") || (@girl.actress == true && params[:type] == "actress"))
      if signed_in?
        new_right = current_user.right + 1;
        current_user.update_attribute(:right, new_right)
      end
      redirect_to :action => :answer, :id => @girl.id, :win => "true"
  	else
      if signed_in?
        new_wrong = current_user.wrong + 1;
        current_user.update_attribute(:wrong, new_wrong)
      end
      redirect_to :action => :answer, :id => @girl.id, :win => "false"
  	end
  end

  def answer
    @girl = Girl.find(params[:id])
    if params[:win] == "true" 
      @win = true 
    else 
      @win = false 
    end

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
