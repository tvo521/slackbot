class LanguageBot < SlackRubyBot::Bot
  command 'hello' do |client, data, match|
    I18n.locale = User.find_by_username(data.user).locale
    text = I18n.t 'hello', user: data.user
    client.say(text: text, channel: data.channel)
  end

  command 'locale' do |client, data, match|
    user = User.find_or_create_by(username: data.user)
    user.locale = match[:expression]
    user.save
    client.say(text: I18n.t('locale_saved', user.locale), channel: data.channel)
  end
end
