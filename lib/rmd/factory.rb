require 'rmd/song_playlist_adapter'
require 'rmd/nct/song'
require 'rmd/nct/playlist'

module RMD
  class Factory
    attr_reader :link

    def initialize(link)
      @link = link
    end

    def build
      case link
      when /nhaccuatui/
        case link
        when /bai-hat/
          RMD::SongPlaylistAdapter.new(RMD::NCT::Song.new(link))
        when /playlist/
          RMD::NCT::Playlist.new(link)
        end
      end
    end

    def self.build(link)
      new(link).build
    end
  end
end