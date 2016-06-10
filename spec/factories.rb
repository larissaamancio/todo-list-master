FactoryGirl.define do

  factory :todo do
    title "Todo list"
    description "descricao"
    association :user
  end

  factory :public_todo, :parent => :todo do
    private false
  end

  factory :private_todo, :parent => :todo do
    private true
  end

  factory :user do
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password "password"
    password_confirmation "password"
  end

  factory :bookmark do
    association :user, :factory => :user
    association :todo, :factory => :todo_list
  end

end

