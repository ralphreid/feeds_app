# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Feed.add_feed("newsrss.bbc.co.uk/rss/newsonline_world_edition/front_page/rss.xml‎")
Feed.add_feed("http://newsrss.bbc.co.uk/rss/sportonline_uk_edition/front_page/rss.xml")