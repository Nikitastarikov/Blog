require 'rails_helper'

RSpec.describe 'comments/index', type: :view do
  before do
    assign(:comments, [
             Comment.create!(
               username: 'Username',
               body: 'MyText',
               post: nil
             ),
             Comment.create!(
               username: 'Username',
               body: 'MyText',
               post: nil
             )
           ])
  end

  it 'renders a list of comments' do
    render
    assert_select 'tr>td', text: 'Username'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
