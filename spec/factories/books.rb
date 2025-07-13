# FactoryBot.define do
# factory :book do
#     title { "Default Title" }
#     author { "Default Author" }
#     publishing_year { 2020 }
# end
# end

# FactoryBot.define do
# factory :book do
#     title { "Sample Book Title" }
#     author { "Jane Doe" }
#     publishing_year { 2020 }
#     description { "A sample book description" }

#     trait :with_invalid_title do
#     title { "Free PDF Download" } # For testing custom validation
#     end
# end
# end
# FactoryBot.define do
# factory :book do
#     sequence(:title) { |n| "Book Title #{n}" }
#     author { "Author Name" }
#     publishing_year { 2020 }
# end
# end
# spec/factories/books.rb
FactoryBot.define do
factory :book do
    sequence(:title) { |n| "Book Title #{n}" } # Guarantees unique titles
    author { "Jane Doe" }
    publishing_year { 2020 }
    description { "Sample description" }
end
end
