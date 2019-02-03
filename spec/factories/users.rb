FactoryBot.define do
  factory :user do
    email  { Faker::Internet.email }
    first_name { Faker::Dog.name }
    last_name { Faker::Artist.name }
    password { Faker::Color.color_name }
    role { :default }
    trait :token do
      token { ENV['GITHUB_API_KEY'] }
    end
    factory :token_user, :traits => [:token]
  end

  factory :admin, parent: :user do
    role { :admin }
  end
end
