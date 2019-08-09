module NumberGenerator
  def self.chat_number(app_token)
    mutex = RedisMutex.new("app#{app_token}_chats")
    if mutex.lock
      begin
        number = RedisClassy.redis.incr("app#{app_token}_chats")
      ensure
        mutex.unlock
      end
    end
  end

  def self.message_number(chat_number)
    mutex = RedisMutex.new("chat#{chat_number}_messages")
    if mutex.lock
      begin
        number = RedisClassy.redis.incr("chat#{chat_number}_messages")
      ensure
        mutex.unlock
      end
    end
  end
end