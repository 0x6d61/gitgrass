require "thor"
require_relative "git_scrap"
module Gitgrass
    class CLI < Thor
        desc "show user","Shows the number of commits in git"
        option "year",aliases:"y",desc: 'Specify the year to display'
        def show(user)
            git_scrap = GitScrap.new(user)
            git_scrap.year = options["year"] if options["year"]
            git_scrap.make_grass_table()
            git_scrap.tile_table.each { |t| puts t.join }
        end
    end
end