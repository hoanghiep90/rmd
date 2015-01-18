require 'open-uri'
require 'ruby-progressbar'

module RMD
  class Downloader
    attr_reader :link

    def initialize(link)
      @link = link
    end

    def download
      puts file_name.green

      progress_bar = ProgressBar.create(
        starting_at: 0,
        total: nil,
        format: "%a %B %p%% %r KB/sec",
        rate_scale: lambda { |rate| rate / 1024 }
      )

      content_length_proc = Proc.new { |content_length|
        progress_bar.total = content_length
      }

      progress_proc = Proc.new { |bytes_transferred|
        if progress_bar.total && progress_bar.total < bytes_transferred
          progress_bar.total = nil
        end
        progress_bar.progress = bytes_transferred
      }

      open(link, "rb", content_length_proc: content_length_proc, progress_proc: progress_proc) do |page|
        File.open(file_name, "wb") do |file|
          file.write(page.read)
        end
      end
    end

    def self.download(link)
      new(link).download
    end

    private

    def file_name
      @file_name ||= uncached_file_name
    end

    def uncached_file_name
      uri = URI.parse(link)
      name = CGI::parse(uri.query.to_s)['filename'].first
      if name
        name
      else
        File.basename(uri.path)
      end
    end
  end
end
