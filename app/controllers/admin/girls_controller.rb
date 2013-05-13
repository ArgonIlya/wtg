# -*- coding: utf-8 -*-
class Admin::GirlsController < Admin::ApplicationController


  def index
    @girls = Girl.all
  end

  def new
    @girl = Girl.new
  end
  
  def create
    @girl = Girl.new(params[:girl]) 
  @girl.save
  redirect_to :action => :show, :id => @girl.id
  end

  def show
    @girl = Girl.find(params[:id])
  end

end
