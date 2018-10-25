class TweetNotifierJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @users = User.all
    @users.each do |user|
      UserMailer.with(user: user).welcome_email.deliver
    end
  end
end
