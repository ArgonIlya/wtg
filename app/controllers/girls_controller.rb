# -*- coding: utf-8 -*-
class GirlsController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy, :show, :new]


  def play
  	offset = rand(Girl.count)
	  @girl = Girl.first(:offset => offset)
  end

  def click_girl
  	@girl = Girl.find(params[:id])
  	if (@girl.actress)
  		redirect_to :action => :lose, :id => @girl.id
  	else
  		redirect_to :action => :win, :id => @girl.id
  	end
  end

  def click_actress
  	@girl = Girl.find(params[:id])
  	if (@girl.actress)
  		redirect_to :action => :win, :id => @girl.id
  	else
  		redirect_to :action => :lose, :id => @girl.id
  	end
  end

  def win
    @girl = Girl.find(params[:id])
  end

  def lose
    @girl = Girl.find(params[:id])
  end


  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
