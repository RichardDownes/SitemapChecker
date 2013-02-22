require 'csv'

module Report

    def add_report_item(item, output_dir)
        # append the report item to the report
        report_name = item.sitemap[item.sitemap.rindex("/"), item.sitemap.length] + ".csv"
        path = output_dir + "/" + report_name
        CSV.open(path, "a") do |csv|
            csv << [item.code, item.url, item.endpoint]
        end

    end

end


class ReportItem
    attr_accessor :url, :sitemap, :code, :endpoint
    def initialize
        @url = ""
        @sitemap = ""
        @code = 0
        @endpoint = ""
    end


    def to_s
        return '"' + @code + '","' + @url + '","' + @endpoint + "\"\n"
    end
end
