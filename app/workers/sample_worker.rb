class SampleWorker

  include Sidekiq::Worker
  sidekiq_options queue: :sample

  def perform()
    puts "\n----------test sidekiq----------\n"
  end

end