namespace :db do
    desc "Delete all users"
    task delete_users: :environment do
      User.destroy_all()
      puts "All users have been deleted"
    end
  end