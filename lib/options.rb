
require 'optparse'

module Options 
    def get_args
        options = {}
        opt_parser = OptionParser.new do |opt|
            opt.banner = "Usage: sitemap-checker --index INDEX --output-dir OUTPUTDIR [--domain DOMAIN]"

            opt.on("--index INDEX", "The sitemap index file") do |index|
                options[:index] = index
            end

            opt.on("--output-dir OUTPUT-DIR", "The output directory for reports") do |output_dir|
                options[:output_dir] = output_dir
            end

            opt.on("--domain DOMAIN", "Replace the domain name with this") do |domain|
                options[:domain] = domain
            end

            opt.on("--help", "Help") do
                options[:help] = true
            end
        end

        opt_parser.parse!

        if options[:help] != nil
            puts opt_parser
            exit
        end

        if options[:index] == nil
            puts opt_parser
            exit
        end

        if options[:output_dir] == nil
            puts opt_parser
        end

        return options
    end

end
