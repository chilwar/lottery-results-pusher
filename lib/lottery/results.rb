require 'lottery/results/lotto'
require 'lottery/results/double_color_ball'
require 'lottery/pusher'

module Lottery
  module Results
    class << self
      def push(name)
        wday = Time.now.wday
        res =
        case name
        when :lotto
          # 大乐透  每周一、三、六 20:30 开奖
          [1, 3, 6].include?(wday) && Lotto.new.result
        when :double_color_ball
          # 双色球  每周二、四、日 21:15 开奖
          [0, 2, 4].include?(wday) && DoubleColorBall.new.result
        end

        Pusher.new(res).send unless res.to_s.empty? || res.is_a?(FalseClass)
      end
    end
  end
end