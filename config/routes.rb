Rails.application.routes.draw do
  # get 'admins/index'
  # get 'admins/new'
  # get 'admins/signin'

  root "customers#index"

  get "customers/new", to: "customers#new", as: "new_customer"
  get "customers/signin", to: "customers#signin", as:"signin_customer"
  post "customers/details", to: "customers#validate_signin", as: "validate_signin"

  get "customers/:id/changepassword", to: "customers#changepassword", as: "changepassword_customer"
  put "customers/:id/updatechangepassword", to: "customers#update_changepassword", as: "update_changepassword"

  get "customers/forgotpassword", to: "customers#forgotpassword", as: "forgotpassword_customer"
  put "customers/:id/updateforgotpassword", to: "customers#update_forgotpassword", as: "update_forgotpassword"

  get "customers/security", to: "customers#security", as: "security_customer"
  post "customers/validatesecurity", to: "customers#validate_security", as: "validate_security"

  get "customers/securityanswer", to: "customers#security_answer", as: "security_answer"
  post "customers/validatesecurityanswer", to: "customers#validate_security_answer", as: "validate_security_answer"

  get "customers/invalid", to: "customers#invalid", as: "invalid_customer"

  get "customers/:customer_id/saving_account/:id/credit_money", to: "saving_accounts#credit", as:"credit_money_to_account"
  get "customers/:customer_id/saving_account/:id/withdraw_money", to: "saving_accounts#withdraw", as:"withdraw_money"
  get "customers/:customer_id/saving_account/:id/transfer_money", to: "saving_accounts#transfer", as:"transfer_money"

  post "customers/:customer_id/saving_account/:id/credit_money", to: "saving_accounts#credit_money_to_account"
  post "customers/:customer_id/saving_account/:id/withdraw_money", to: "saving_accounts#withdraw_money"
  post "customers/:customer_id/saving_account/:id/transfer_money", to:"saving_accounts#transfer_money"

  get "customers/:id/my_accounts", to: "customers#my_accounts", as: "my_accounts"
  get "customers/:id/savings_account/check_balance", to: "saving_accounts#balance", as: "check_balance"

  get "/customers/:customer_id/fixed_deposits/:id/maturity_amount", to:"fixed_deposits#maturity_amount", as:"customer_fixed_deposit_maturity_amount"
  get "/customers/:customer_id/fixed_deposits/:id/compound_interest", to:"fixed_deposits#compound_interest", as:"customer_fixed_deposit_compound_interest"
#------------------------------------------------------------------------------------------------------------------------#

  get "/admin/fd_details/:customer_id/fixed_deposits/:id/maturity_amount", to:"admins#admin_maturity_amount", as:"fd_maturity_admin"
  

  get "admins/signin", to: "admins#admin_signin", as:"admin_signin"
  post "admins/details", to: "admins#validate_admin_signin", as: "validate_admin_signin"

  get "admin/dashboard", to:"admins#index", as:"admin_dashboard"
  get "admin/all_customers", to:"admins#admin_customers", as:"admin_customers"
  get "admin/customer_profile/:id", to:"admins#customer_profile", as:"customer_profile"
  get "admin/all_saving_accounts", to:"admins#admin_savings", as:"admin_savings"
  get "admin/all_fixed_deposits", to:"admins#admin_fds", as:"admin_fds"
  get "admin/fd_details", to:"admins#fd_details",as:"fd_details"


  
  resources :customers do
    resources :saving_accounts
  end

  resources :customers do
    resources :fixed_deposits
  end

end
