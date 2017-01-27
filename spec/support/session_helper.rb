module Features
  module SessionHelpers
    def sign_in(email, password)
      visit new_user_session_path
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_on"Log in"
    end
  end
end
