# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Feed.delete_all
Article.delete_all

# test account
# User.create!(email: "teamexpats.wdisep2013@gmail.com", password: "teamexpats", role: "user")


# Commented out: Need REAL RSS link
# technology
Feed.get_feed("http://feeds2.feedburner.com/techradar/computing-news", "technology")
Feed.get_feed("http://feeds.mashable.com/Mashable", "technology")
Feed.get_feed("http://feeds.gawker.com/lifehacker/full", "technology")
Feed.get_feed("http://feeds.feedburner.com/TechViral", "technology")
Feed.get_feed("http://feeds.feedburner.com/uk/gizmodo", "technology")


# business
Feed.get_feed("http://mf.feeds.reuters.com/reuters/UKTopNews", "business")
Feed.get_feed("http://feeds.venturebeat.com/VentureBeat", "business")
Feed.get_feed("http://feeds.feedburner.com/AVcVentureCapitalAndTechnology", "business")
Feed.get_feed("http://feeds.feedburner.com/AtlanticBusinessChannel", "business")

feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/PaulDixExplainsNothing")

# news
Feed.get_feed("http://feeds.bbci.co.uk/news/technology/rss.xml", "news")
Feed.get_feed("http://blogs.cbn.com/HurdontheWeb/Rss.aspx", "news")


# photography
Feed.get_feed("http://feeds.feedburner.com/OneBigPhoto", "photography")
Feed.get_feed("http://feeds.feedburner.com/shoottokyo", "photography")


# design
Feed.get_feed("http://feeds.feedburner.com/yankodesign", "design")
Feed.get_feed("http://feeds.feedburner.com/fubiz", "design")
Feed.get_feed("http://feeds2.feedburner.com/Swissmiss", "design")
Feed.get_feed("http://feeds.feedburner.com/fastcodesign/feed", "design")
Feed.get_feed("http://feeds.feedburner.com/dezeen", "design")


# cooking
Feed.get_feed("http://feeds.feedburner.com/smittenkitchen", "cooking")
Feed.get_feed("http://feeds.feedburner.com/ourbestbites/djLu", "cooking")
Feed.get_feed("http://feeds.feedburner.com/LoveAndOliveOil", "cooking")
Feed.get_feed("http://feeds.feedburner.com/saveurkitchen", "cooking")
Feed.get_feed("http://feeds.feedburner.com/ACoupleCooks", "cooking")



# fashion
Feed.get_feed("http://feeds.feedburner.com/fashionistacom", "fashion")
Feed.get_feed("http://feeds.feedburner.com/BubbyAndBean", "fashion")

# travel
Feed.get_feed("http://www.lonelyplanet.com/blog/feed/atom/", "travel")


