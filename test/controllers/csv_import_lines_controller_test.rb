require 'test_helper'

class CsvImportLinesControllerTest < ActionController::TestCase
  setup do
    @csv_import_line = csv_import_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:csv_import_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create csv_import_line" do
    assert_difference('CsvImportLine.count') do
      post :create, csv_import_line: { article: @csv_import_line.article, csv_import_id: @csv_import_line.csv_import_id, size: @csv_import_line.size, title: @csv_import_line.title }
    end

    assert_redirected_to csv_import_line_path(assigns(:csv_import_line))
  end

  test "should show csv_import_line" do
    get :show, id: @csv_import_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @csv_import_line
    assert_response :success
  end

  test "should update csv_import_line" do
    patch :update, id: @csv_import_line, csv_import_line: { article: @csv_import_line.article, csv_import_id: @csv_import_line.csv_import_id, size: @csv_import_line.size, title: @csv_import_line.title }
    assert_redirected_to csv_import_line_path(assigns(:csv_import_line))
  end

  test "should destroy csv_import_line" do
    assert_difference('CsvImportLine.count', -1) do
      delete :destroy, id: @csv_import_line
    end

    assert_redirected_to csv_import_lines_path
  end
end
