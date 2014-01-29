class User < ActiveRecord::Base
	has_many :messages

  def load_message
    @message = Message.new
  end

end
