# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Feed.delete_all
Article.delete_all

Feed.get_feed("http://feeds.feedburner.com/TechCrunch")
Feed.get_feed("http://sethgodin.typepad.com/seths_blog/atom.xml")
Feed.get_feed("http://houseofreggae.podomatic.com/rss2.xml")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
# Feed.get_feed("")
