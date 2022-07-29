FactoryBot.define do
    factory :user do
        username { "johnd" }
        email { "johnd@gmail.com" }
        firstName { "John" }
        lastName { "Doe" }
        phoneNumber { 3213214321 }
        birthday { DateTime.new(2000, 07, 10) }
        password { "secret" }
        password_confirmation { "secret" }
    end
end