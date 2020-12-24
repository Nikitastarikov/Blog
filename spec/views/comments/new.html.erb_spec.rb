require 'rails_helper'

RSpec.describe 'comments/new', type: :view do
  before do
    assign(:comment, Comment.new(
                       username: 'MyString',
                       body: 'MyText',
                       post: nil
                     ))
  end

  it 'renders new comment form' do
    render

    assert_select 'form[action=?][method=?]', comments_path, 'post' do
      assert_select 'input[name=?]', 'comment[username]'

      assert_select 'textarea[name=?]', 'comment[body]'

      assert_select 'input[name=?]', 'comment[post_id]'
    end
  end
end