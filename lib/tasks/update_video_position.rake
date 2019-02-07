namespace :update_video_position do
  desc "Updates nil values to integer"

  task :add_one_to_position => :environment do
    Video.where(position: nil).each do |v|
      v.update_attribute :position, '1'
    end
  end
end
