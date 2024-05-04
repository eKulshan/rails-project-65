# frozen_string_literal: true

require 'test_helper'

class Web::BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:first)
    @bulletin = bulletins(:first)
  end

  test 'should get index' do
    get bulletins_path
    assert_response :success
  end

  test 'should get new' do
    sign_in users(:first)

    get new_bulletin_path
    assert_response :success
  end

  test 'should create bulletin' do
    sign_in @user
    post bulletins_path, params: { bulletin: { title: @bulletin.title,
                                               description: @bulletin.description,
                                               category_id: @bulletin.category.id,
                                               image: file_fixture_upload('first.jpeg') } }

    created_bulletin = Bulletin.find_by(
      title: @bulletin.title,
      description: @bulletin.description,
      category_id: @bulletin.category.id,
      user_id: current_user.id
    )

    assert(created_bulletin)
    assert_redirected_to bulletin_path(Bulletin.last)
  end

  # test 'should show bulletin' do
  #   get bulletin_path(@bulletin)
  #   assert_response :success
  # end

  # test 'should get edit' do
  #   get edit_bulletin_path(@bulletin)
  #   assert_response :success
  # end

  # test 'should update bulletin' do
  #   patch bulletin_path(@bulletin), params: { bulletin: {} }
  #   assert_redirected_to bulletin_path(@bulletin)
  # end

  # test 'should destroy bulletin' do
  #   assert_difference('Web::Bulletin.count', -1) do
  #     delete bulletin_path(@bulletin)
  #   end

  #   assert_redirected_to bulletins_path
  # end
end
