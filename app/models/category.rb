class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '料理' },
    { id: 3, name: '掃除' },
    { id: 4, name: '洗濯' },
    { id: 5, name: '育児' },
    { id: 6, name: '介護' },
    { id: 7, name: '家計管理' },
    { id: 8, name: '収納・整理整頓' },
    { id: 9, name: '生活環境の保守・交流' },
    { id: 10, name: '季節行事' },
    { id: 11, name: 'ペット' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tasks
end
