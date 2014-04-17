require 'jumpstart_auth'
require 'bitly'

Bitly.use_api_version_3

class MicroBlogger
  attr_reader :client

  def initialize
    puts 'Initializing'
    @client = JumpstartAuth.twitter # authentictes with twitter api
  end

  # sends out tweet message from command line
  def tweet(message)
    if message.length < 140
      @client.update(message)
      puts 'SUCCESS: msg posted'
    else
      puts 'ERROR: msg over 140 characters.'
    end
  end

  # main loop of program
  def run
    puts 'Welcome to the JSL Twitter Client!'
    command = ''
    while command != 'q'
      printf 'enter command:'
      input = gets.chomp
      parts = input.split
      command = parts[0]
      case command
         when 'q' then puts 'Goodbye!'
         when 't' then tweet(parts[1..-1].join(' '))
         when 'dm' then dm(parts[1], parts[2..-1].join(' '))
         when 'spam' then spam_my_followers(parts[1..-1].join(' '))
         when 'elt' then everyones_last_tweet
         when 's' then shorten(parts[1..-1].join)
         when 'turl' then tweet(parts[1..-2].join(' ') + ' ' + shorten(parts[-1]))
         else
           puts "Sorry, I don't know how to (#{command})"
      end
    end
  end

  # sends a direct message to target(person)
  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message

    screen_names = @client.followers.map { |follower| follower.screen_name }
    if screen_names.include?(target)
      msg = "d #{target} #{message}"
      tweet(msg)
    else
      puts 'ERROR: can only send direct message to followers.'
    end
  end

  # returns list of your followers
  def followers_list
    screen_names = []
    @client.followers.each { |follower| screen_names << follower['screen_name'] }
    screen_names
  end

  # sends direct message to all your followers
  def spam_my_followers(message)
    list = followers_list
    list.each { |f| dm(f, message) }
  end

  # prints last tweet of all the people you follow
  def everyones_last_tweet
    friends = @client.friends.sort_by { |friend| friend.screen_name.downcase }
    friends.each do |friend|
      timestamp = friend.status.created_at
      puts "#{friend.screen_name.upcase} (#{timestamp.strftime("%b %d")}): #{friend.status.text}"
    end
  end

  def shorten(original_url)
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    puts "Shortening this URL: #{original_url}"
    bitly.shorten(original_url).short_url
  end
end

blogger = MicroBlogger.new
blogger.run
