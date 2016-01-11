# embed gyazo png image

module.exports = (robot) ->

  robot.adapter.client?.on? 'raw_message', (msg) ->
    unless msg.type is 'message' and msg.subtype is 'message_changed'
      return
    return unless channel = robot.adapter.client.getChannelByID(msg.channel).name
    for att in msg.message.attachments
      if !att.image_url and /^https?:\/\/gyazo.com\/[a-z\d]{32}$/.test att.from_url
        robot.send {room: channel}, "#{att.from_url}.png"
