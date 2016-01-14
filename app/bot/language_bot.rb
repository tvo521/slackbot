class LanguageBot < SlackRubyBot::Bot
  command 'hello' do |client, data, match|
    client.say(text: "hello <#{data.user}>!", channel: data.channel)
  end
end