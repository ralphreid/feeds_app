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
User.create!(email: "teamexpats.wdisep2013@gmail.com", password: "teamexpats", role: "user")


# Commented out: Need REAL RSS link

# technology
Feed.get_feed("http://feeds2.feedburner.com/techradar/computing-news")
Feed.get_feed("http://feeds.mashable.com/Mashable")
Feed.get_feed("http://feeds.gawker.com/lifehacker/full")
Feed.get_feed("http://feeds.feedburner.com/TechViral")
Feed.get_feed("http://feeds.feedburner.com/uk/gizmodo")

# business
Feed.get_feed("http://mf.feeds.reuters.com/reuters/UKTopNews")
Feed.get_feed("http://feeds.venturebeat.com/VentureBeat")
Feed.get_feed("http://feeds.feedburner.com/AVcVentureCapitalAndTechnology")
Feed.get_feed("http://feeds.feedburner.com/AtlanticBusinessChannel")

# news
Feed.get_feed("http://feeds.bbci.co.uk/news/technology/rss.xml")
# Feed.get_feed("http://ireport.cnn.com/feeds/")
# Feed.get_feed("http://www.telegraph.co.uk/rssfeeds/")

# photography
# Feed.get_feed("http://www.amateurphotographer.co.uk/rss-feeds")
Feed.get_feed("http://feeds.feedburner.com/OneBigPhoto")
Feed.get_feed("http://feeds.feedburner.com/shoottokyo")

# design
Feed.get_feed("http://feeds.feedburner.com/yankodesign")
Feed.get_feed("http://feeds.feedburner.com/fubiz")
Feed.get_feed("http://feeds2.feedburner.com/Swissmiss")
Feed.get_feed("http://feeds.feedburner.com/fastcodesign/feed")
Feed.get_feed("http://feeds.feedburner.com/dezeen")

# cooking
Feed.get_feed("http://feeds.feedburner.com/smittenkitchen")
Feed.get_feed("http://feeds.feedburner.com/ourbestbites/djLu")
Feed.get_feed("http://feeds.feedburner.com/LoveAndOliveOil")
Feed.get_feed("http://feeds.feedburner.com/saveurkitchen")
Feed.get_feed("http://feeds.feedburner.com/ACoupleCooks")

# fashion
Feed.get_feed("http://feeds.feedburner.com/fashionistacom")
# Feed.get_feed("http://www.coolhunting.com/index")
Feed.get_feed("http://feeds.feedburner.com/BubbyAndBean")

# travel
# Feed.get_feed("http://www.lonelyplanet.com/blog/feed/atom/")
# Feed.get_feed("http://www.budgettravel.com/latest/hotels/feed/")
# Feed.get_feed("http://www.travelzoo.com/uk/feeds/")
