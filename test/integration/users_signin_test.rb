require 'test_helper'

class UsersSigninTest < ActionDispatch::IntegrationTest
   #test if user sign in with wrong information
  test "sign in with invalid information" do
    #get sing in path
    get signin_path
    #assert_template to check that a failed submission re-renders the new action
    assert_template 'session/new'
    post signin_path, session: { email: "", password: "" }
    #assert_template to check that a failed submission re-renders the new action
    assert_template 'session/new'
    #check if flash method is empty
    assert_not flash.empty?
    #get root path
    get root_path
    #check if flash is not empty
    assert flash.empty?
  end
end
