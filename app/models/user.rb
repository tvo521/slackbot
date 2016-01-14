class User < ActiveRecord::Base
  validates_inclusion_of :locale, in: %w(en vi)
end
