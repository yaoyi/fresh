FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence }
    factory :post_with_comments do
      ignore do
        comments_count 5
      end
      after(:create) do |todo, evaluator|
        create_list(:comment, evaluator.comments_count, commentable: post)
      end
    end
  end
end
