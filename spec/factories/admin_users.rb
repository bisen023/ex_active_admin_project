FactoryBot.define do
  
  factory :admin_user, class: AdminUser do
    email {"joe@gmail.com"}
    password {"Satyam@123"}
    password_confirmation {"Satyam@123"}
    mobile_no {"1212121212"}

  end
end
