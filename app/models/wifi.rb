class Wifi < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'あり（時間無制限）' },
    { id: 2, name: 'あり（時間更新）' },
    { id: 3, name: 'なし' }
  ]
  include ActiveHash::Associations
  has_many :cafetypes
end
