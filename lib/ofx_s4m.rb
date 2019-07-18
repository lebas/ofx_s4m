require "ofx_s4m/version"
require 'pry'
require 'Nokogiri'

# bundle console
# OfxS4m::Reader.new("/Users/eduardoalencar/Downloads/bank/test_pj.ofx")
module OfxS4m
  class Error < StandardError; end

  class Reader
    def initialize(filename = nil)
      unless filename.nil?
        file_text = open(filename, 'r')
        @head, @body = file_text.split('<OFX>')
      end
    end
    private
    def run
      unless @body.nil?
        ofx_text = Nokogiri::XML(@body)
        binding.pry
      end
    end
  end
end
