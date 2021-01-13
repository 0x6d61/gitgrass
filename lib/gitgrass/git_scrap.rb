require "open-uri"
require "rainbow"
require "date"

class GitScrap
  attr_reader :tile_table
  attr_writer :year
  GITHUB_URL = "https://github.com/"
  TILE_COLOR = { bg: Rainbow("[]").color(235, 237, 240).background(235, 237, 240),
                 L1: Rainbow("[]").color(155, 233, 168).background(155, 233, 168),
                 L2: Rainbow("[]").color(111, 197, 100).background(111, 197, 100),
                 L3: Rainbow("[]").color(90, 162, 79).background(90, 162, 79),
                 L4: Rainbow("[]").color(59, 111, 58).background(59, 111, 58),
                 dummy: Rainbow("[]").color(0, 0, 0).background(0, 0, 0) }

  def initialize(user)
    @user = user
    @tile_table = Array.new(7) { [] }
  end

  def get_commit
    url = @year ? "#{GITHUB_URL}#{@user}?tab=overview&from=#{@year}-01-01&to=#{@year}-12-31" : "#{GITHUB_URL}#{@user}"
    html = URI(url)
    body = html.read
    body.scan(/<rect.*--color-calendar-graph-day-(bg|L1|L2|L3|L4).*>/)
  end

  def make_grass_table
    commit_data = self.get_commit().flatten
    if @year
      Date.new(@year, 1, 1).wday.times do |n|
        commit_data.unshift("dummy")
      end
    end
    0.step(commit_data.length - 1, 7) do |index|
      oneweek_tile = commit_data.slice(index, 7)
      oneweek_tile.each_with_index do |item, index|
        @tile_table[index] << TILE_COLOR[item.to_sym]
      end
    end
  end
end
