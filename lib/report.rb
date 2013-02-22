

module Report

    def add(report_item)
        # append the report item to the report
        report_name = report_item.sitemap[report_item.sitemap.rindex("/")]
        puts report_item
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
