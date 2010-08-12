class Post < ActiveRecord::Base
belongs_to   :category
has_many     :comments
validates_presence_of :category_id
cattr_reader :per_page
@@per_page = 2
end
