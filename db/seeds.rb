# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

html = "http://www.languagedaily.com/learn-german/vocabulary/common-german-words"
doc = Nokogiri::HTML(open(html))

table_rows = doc.css("tr")
table_rows.shift # Remove first element (row) from NodeSet

table_rows.each do |row|
  original_text = row.first_element_child.next_element.inner_text
  translated_text = row.first_element_child.next_element.next_element.inner_text
  Card.create(original_text: original_text, translated_text:translated_text, review_date: Time.now)
end
