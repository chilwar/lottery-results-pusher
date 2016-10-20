require 'spec_helper'

describe Lottery::Results::Lotto do
  it 'grab the result of Lotto' do
    results = init!

    expect(Lottery::Results::Lotto.new.result).to eq [Date.today.to_s, '大乐透开奖结果：', results[:lotto_results].insert(-3, '|').join(' ')].join(' ')
  end
end