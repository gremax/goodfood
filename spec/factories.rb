FactoryGirl.define do
  factory :user do
    id       1
    name     "Omar Crab"
    email    "omar.crab@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :recipe do
    name        "Lobster omelet"
    body        "Beat the eggs and cook in an omelet pan over medium heat…"
    ingredients "4 eggs and lobster"
    category_id 1
    user_id     1
  end
end