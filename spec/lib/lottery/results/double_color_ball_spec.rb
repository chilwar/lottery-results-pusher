require 'spec_helper'

describe Lottery::Results::DoubleColorBall do
  it 'grab the result of double color ball' do
    results = init!

    expect(Lottery::Results::DoubleColorBall.new.result).to eq [Date.today.to_s, '双色球开奖结果：', results[:ball_results].insert(-2, '|').join(' ')].join(' ')
  end
end