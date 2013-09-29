# -*- coding: utf-8 -*-
class Admin::GirlsController < Admin::ApplicationController


  def index
    @girls = Girl.all.order_by_id
  end

  def new
    @girl = Girl.new
    3.times { @girl.photos.build }
  end
  
  def create
    @girl = Girl.new(params[:girl]) 
    if @girl.save
      redirect_to admin_girls_path, :notice => "Successfully created product."
    else
      render :action => 'new'
    end
  end

  def show
    @girl = Girl.find(params[:id])
    @answer_float = (@girl.right * 1.0 / (@girl.right + @girl.wrong))
  end

  def edit
    @girl = Girl.find(params[:id])
    3.times { @girl.photos.build}
  end

  def update
    @girl = Girl.find(params[:id])
    if @girl.update_attributes(params[:girl])
      redirect_to admin_girls_path, :notice  => "Successfully updated product."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @girl = Girl.find(params[:id])
    @girl.destroy
    redirect_to admin_girls_url, :notice => "Successfully destroyed product."
  end

  def update_top
    @girls = Girl.all
  end
end
