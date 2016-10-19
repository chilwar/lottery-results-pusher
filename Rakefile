require_relative './config/boot'

namespace :lottery do
  desc '双色球'
  task :double_color_ball do
    Lottery::Results.push(:double_color_ball)
  end

  desc '大乐透'
  task :lotto do
    Lottery::Results.push(:lotto)
  end
end