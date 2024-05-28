class DomainEvent < ApplicationRecord
  belongs_to :aggregate, polymorphic: true
end
