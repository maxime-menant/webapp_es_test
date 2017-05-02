class AddArticleSeeds < ActiveRecord::Migration[5.0]
  def up
    count = 100
    print "Generating articles..."
    (1..count).each_with_index do |title, i|
      Article.create title: "Title #{title}", content: 'Lorem ipsum dolor', published_on: i.days.ago.utc
      print '.' if i % count.to_i/10 == 0
    end
    puts "\n"
  end
end
