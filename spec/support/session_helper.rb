module Features
  module SessionHelpers
    def sign_in(email, password)
      visit("/")
      click_link("Log In")
      within("#sign_in_modal") do
        fill_in("user[email]", with: email)
        fill_in("user[password]", with: password)
        click_button("Sign in")
      end
    end
  end
end
