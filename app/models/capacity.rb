class Capacity < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '20席以下' },
    { id: 2, name: '21〜50席' },
    { id: 3, name: '51〜80席' },
    { id: 4, name: '81席以上' },
  ]
  include ActiveHash::Associations
  has_many :cafetypes
end
