module OfxS4m
  module Format
    class V102
      attr_accessor :ofx_body

      def initialize(ofx_body)
        @ofx_body = Nokogiri::HTML.parse(clear_body(ofx_body)) if ofx_body
        #binding.pry
      end

      private
      def clear_body(body)
        body.gsub!(/>\s+</m, "><").gsub(/\s+</m, "<").gsub(/>\s+/m, ">").gsub(/<(\w+?)>([^<]+)/m, '<\1>\2</\1>') if body
      end
    end
  end
end
