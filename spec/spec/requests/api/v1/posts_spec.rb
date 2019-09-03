require 'rails_helper'

describe 'PostAPI' do
  it 'すべてのポストを取得する' do
    FactoryBot.create_list(:post, 10)

    get '/api/v1/posts'
    json = JSON.perse(response.body)

    # リクエスト成功を表す200が返ってくるか確認
    expect(response.status).to eq(200)

    #正しい数のデータが返されたか確認する。
    expect(json['data'].length).to eq(10)
  end
end