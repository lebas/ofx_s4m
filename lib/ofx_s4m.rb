require "ofx_s4m/version"
require "ofx_s4m/header"
require "ofx_s4m/format/v102"

require "nokogiri"
require "pry"

# bundle console
# OfxS4m::Reader.new("/Users/eduardoalencar/Downloads/bank/test_pj.ofx")
module OfxS4m
  class Error < StandardError; end
  class FileError < StandardError; end
  class UnsupportedFormatError < StandardError; end

  class Reader
    attr_reader :head
    attr_reader :body

    def initialize(filename = nil)
      file_text = file_read(filename) unless filename.nil?
      prepare_ofx(file_text) unless file_text.nil?
    end

    private
    def file_read(filename = nil)
      begin
        ofx_text = open(filename, 'r').read
        return (ofx_text.encoding.name == "UTF-8" ? ofx_text : ofx_text.encode('UTF-8'))
      rescue
        raise OfxS4m::FileError
      end
    end

    def prepare_ofx(ofx_text)
      @head, @body = ofx_text.split(/<OFX>/, 2)
      head = OfxS4m::Header.new(@head)
      case head.version
      when /102/ then
        OfxS4m::Format::V102.new(@body)
      when /103/ then
      when /200/ then
      when /202/ then
      when /211/ then
      when /220/ then
      else
        raise OfxS4m:UnsupportedFormatError
      end
    end
  end
end
