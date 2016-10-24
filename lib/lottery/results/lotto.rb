require 'lottery/results/base'
# 大乐透
module Lottery
  module Results
    class Lotto < Base
      def result
        name = "大乐透"
        
        tr = content.at(".main .kj_box table tr td:contains('#{ name }')").parent()

        time = tr.at("td:eq(3)").text()
        
        numbers = tr.css(".ballbg span").map(&:text).insert(-3, '|').join(' ')

        "#{ time } #{ name }开奖结果： #{ numbers }"
      end
    end
  end
end