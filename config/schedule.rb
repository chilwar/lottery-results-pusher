# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# Learn more: http://github.com/javan/whenever
env :PATH, ENV['PATH']

set :output, "/tmp/whenever.log"

# 双色球  每周二、四、日 21:15 开奖
# 星期几在代码里判断=_=!
every :day, at: '21:35' do
  rake "lottery:double_color_ball"
end

# 大乐透  每周一、三、六 20:30 开奖
# 星期几在代码里判断=_=!
every :day, at: '21:00' do
  rake "lottery:lotto"
end
