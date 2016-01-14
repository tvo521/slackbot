class LanguageBot < SlackRubyBot::Bot
  command 'hello' do |client, data, match|
    I18n.locale = :vi
    text = I18n.t 'hello'
    client.say(text: text, channel: data.channel)
  end
end