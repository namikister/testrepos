class TestplanTcversion < ActiveRecord::Base
  belongs_to :tcversion
  belongs_to :testplan
end
