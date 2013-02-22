# downloading shit


require 'net/http'
module Download
    # downloads a file
    def download(file)
        # strip off http and break the file up into domain and file
        file = file[7, file.length]
        domain = file[0, file.index("/")]
        file = file[file.index("/"), file.length]
        response = nil
        Net::HTTP.start(domain) do |http|
            response = http.get(file)
        end
        return response
    end
end
