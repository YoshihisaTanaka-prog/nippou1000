class Main < ApplicationRecord

  belongs_to :user
  
  has_many :to_dos
  accepts_nested_attributes_for :to_dos, reject_if: proc {|attributes| attributes['name'].blank? and attributes['time_limit'].blank?}, allow_destroy: true

  has_many :points, dependent: :destroy
  accepts_nested_attributes_for :points, reject_if: proc {|attributes| attributes['text'].blank?}, allow_destroy: true
  
  has_many :what_to_dos, dependent: :destroy
  accepts_nested_attributes_for :what_to_dos, reject_if: proc {|attributes| attributes['name'].blank? and attributes['from_time'].blank? and attributes['to_time'].blank?}, allow_destroy: true

  has_many :learned_lists, dependent: :destroy
  accepts_nested_attributes_for :learned_lists, reject_if: proc {|attributes| attributes['text'].blank?}, allow_destroy: true

end
