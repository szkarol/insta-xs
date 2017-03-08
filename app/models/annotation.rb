class Annotation < ApplicationRecord
  belongs_to :photo

  validates_presence_of :photo
end
