# This support package contains modules for authenticaiting
# devise users for request specs.

# This module authenticates users for request specs.#
module ValidUserRequestHelper
  # Define a method which signs in as a valid user.
  def sign_in_as_a_valid_user
    @user = User.create({
      email: 'test@domain.com', 
      password: 'password', 
      password_confirmation: 'password'})

    post_via_redirect user_session_path, 
      'user[email]' => @user.email, 'user[password]' => @user.password
  end
end

