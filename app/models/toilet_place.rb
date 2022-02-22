class ToiletPlace < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '店内' },
    { id: 2, name: '店外' },
  ]
  include ActiveHash::Associations
  has_many :cafetypes
end
