module Admin::SignupTokensHelper
  def toggle_signup_token_active_button(signup_token)
    text = signup_token.active? ? "無效化" : "有效化"
    link_to(text, toggle_active_admin_signup_token_path(signup_token), data: { confirm: "確定嗎？" }, method: :post)
  end
end
