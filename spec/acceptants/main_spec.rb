require 'spec_helper'

describe RMD::Main do
  describe '#download' do
    let(:run_method) { RMD::Processor.process(link) }
    let(:file_path) { File.expand_path("../../../#{file_name}", __FILE__) }

    context 'when downloads song from nhaccuatui' do
      let(:link) { 'http://www.nhaccuatui.com/bai-hat/honjitsu-mijukumono-juken-no-kamisama-ost-tv-version-tokio.tFBwsJKDGQX9.html' }
      let(:file_name) { 'HonjitsuMijukumonoJukenNoKamisamaOSTTVVersion-TOKIO-3164566.mp3' }
      let(:scenario) { 'nhaccuatui song'}
      it_behaves_like 'download'
    end

    context 'when downloads playlist from nhaccuatui' do
      let(:link) { 'http://www.nhaccuatui.com/playlist/dev-playlist-dang-cap-nhat.jn0g1fg4Z6UO.html' }
      let(:file_name) { 'BlazeTvSize-KajiuraYuki_35ax5_hq.mp3' }
      let(:file_path) { File.expand_path("../../../#{file_name}", __FILE__) }
      let(:scenario) { 'nhaccuatui playlist' }
      it_behaves_like 'download'
    end

    context 'when downloads song from zing mp3' do
      let(:link) { 'http://mp3.zing.vn/bai-hat/Bird-TV-Size-Yuya-Matsushita/ZWZCO98B.html' }
      let(:file_name) { 'Bird TV Size - Yuya Matsushita.mp3' }
      let(:scenario) { 'zing song' }
      it_behaves_like 'download'
    end

    context 'when downloads playlist from zing mp3' do
      let(:link) { 'http://mp3.zing.vn/playlist/dev-playlist-zid-sincepast/IO0E698Z.html' }
      let(:file_name) { 'sharp TV Size - Negoto.mp3' }
      let(:scenario) { 'zing playlist' }
      it_behaves_like 'download'
    end
  end
end
