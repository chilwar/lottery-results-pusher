require 'spec_helper'

describe 'Whenever Schedule' do
  before :each do
    load File.expand_path('../../Rakefile', __FILE__)
  end

  it 'makes sure `rake` statements exist' do
    schedule = Whenever::Test::Schedule.new(vars: { environment: 'production' })
    
    schedule.jobs[:rake].each do |tasks|
      expect(Rake::Task.task_defined?(tasks[:task])).to be_truthy
    end
  end
end