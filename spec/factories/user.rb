FactoryGirl.define do
  factory :user do
    name "Hamide"
    surname "Gumuslu"
    password "111111"
    username {"#{name}.#{surname}"}
    email { "#{name}.#{surname}@example.com".downcase }
  end
end
