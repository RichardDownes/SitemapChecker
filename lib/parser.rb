# Parses sitemap files

require 'nokogiri'


module Parser


    # parses an xml sitmap index and returns the urls
    def parse_index(xml)
        doc = Nokogiri::XML(xml)
        urls = []
        doc.css("sitemapindex sitemap loc").each do |url|
            urls << url.content
        end
        return urls
    end

    # parses an xml sitemap and returns the URLs
    def parse_sitemap(xml)
        doc = Nokogiri::XML(xml)
        urls = []
        doc.css("urlset url loc").each do |url|
            urls << url.content
        end
        return urls
    end

end
