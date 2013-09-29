# -*- coding: utf-8 -*-
class Admin::GirlsController < Admin::ApplicationController


  def index
    @girls = Girl.all
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
    top = []
    @girls.each do |girl|
      if ((girl.right + girl.wrong) > 100)
        top.push({id: girl.id, ratio: (girl.right * 1.0 / (girl.right + girl.wrong))})
      else
        top.push({id: girl.id, ratio: 0})
      end
    end
    sort = top.sort_by{|t| t[:ratio]}
    sort = sort.reverse!
    sort.each_with_index do |girl, index|
      Girl.find(girl[:id]).update_attribute(:top_all, index + 1)
    end
    @girls.sort_by!{|g| g.top_all}
    render :action => 'index'
  end


end
