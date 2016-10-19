# 双色球
module Lottery
  module Results
    class DoubleColorBall
      attr_accessor :content

      def initialize
        url = 'http://baidu.lecai.com/lottery/draw'
        self.content = Nokogiri::HTML(open(url))
      end

      def result
        name = "双色球"
        
        tr = content.at(".main .kj_box table tr td:contains('#{ name }')").parent()

        time = tr.at("td:eq(3)").text()
        
        numbers = tr.css(".ballbg span").map(&:text).insert(-2, '|').join(' ')

        "#{ time } #{ name }开奖结果： #{ numbers }"
      end

      private :content=
    end
  end
end