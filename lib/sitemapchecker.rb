
require_relative "options.rb"
require_relative "download.rb"
require_relative "parser.rb"
require_relative "report.rb"

class SitemapChecker
    include Options
    include Download
    include Parser
    include Report

    def check_sitemaps
        args = get_args
        index = download(args[:index]).body
        sitemap_urls = parse_index(index)

        sitemap_urls.each do |sitemap_url|
            sitemap = download(sitemap_url).body
            urls = parse_sitemap(sitemap)
            urls.each do |url|
                response = download(url)
                report_item = ReportItem.new
                report_item.url = url
                report_item.sitemap = sitemap_url
                report_item.code = response.code
                if response.code == "301" || response.code == "302"
                    report_item.endpoint = response.header["location"]
                end
                add_report_item(report_item, args[:output_dir])
            end
        end
    end

end
