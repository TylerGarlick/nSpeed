class SubmittalDocument < ActiveRecord::Base
  belongs_to :submittal
  belongs_to :document
end
