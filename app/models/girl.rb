# -*- coding: utf-8 -*-
class Girl < ActiveRecord::Base
  attr_accessible :name, :actress, :about, :photos_attributes, :photo_num, :top_all, :top_girls, :top_actress
  validates_presence_of :name
  has_many :photos
  accepts_nested_attributes_for :photos, :reject_if => proc { |a| a['file'].blank? } , :allow_destroy => true 
end
