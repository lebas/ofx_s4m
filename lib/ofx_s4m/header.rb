module OfxS4m
  class Header
    attr_accessor :head
    attr_accessor :version
    def initialize(head = nil)
      @head = head
      clear_head
    end

    private
    def clear_head
      unless @head.nil?
        @head = @head.split("\n").map{|item| item.split(":") if item.split(":").size == 2 }.compact.to_h
        @version = @head["VERSION"] unless @head.nil? || !@head.key?('VERSION')
      end
    end
  end
end
