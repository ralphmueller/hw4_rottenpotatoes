FactoryGirl.define do
  factory :movie do
    title 'THX-1138'
    rating 'PG'
    release_date {10.weeks.ago}
    director 'George Lucas'
  end
end
