FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence }
    factory :article_with_comments do
      ignore do
        comments_count 5
      end
      after(:create) do |todo, evaluator|
        create_list(:comment, evaluator.comments_count, commentable: article)
      end
    end
  end
end
