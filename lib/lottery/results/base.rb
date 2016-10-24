module Lottery
  module Results
    class Base
      attr_accessor :content

      def initialize
        url = 'http://baidu.lecai.com/lottery/draw'
        self.content = Nokogiri::HTML(open(url))
      end

      def result
        raise 'override this method'
      end

      private :content=
    end
  end
end