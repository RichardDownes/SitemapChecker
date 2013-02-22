#!/usr/bin/env ruby

require_relative "lib/sitemapchecker.rb"

checker = SitemapChecker.new

checker.check_sitemaps

#index = checker.download("http://localhost/sitemap_index.xml").body
#sitemap_urls = checker.parse_index(index)

#sitemap_urls.each do |sitemap_url|
#    sitemap = checker.download(sitemap_url).body
#    urls = checker.parse_sitemap(sitemap)
#    urls.each do |url|
#        response = checker.download(url)
#        puts response.header.code
#    end
#end
