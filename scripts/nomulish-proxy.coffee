# Description:
#   @victoriaにnomulishさせる
#
# Author:
#   @shokai


module.exports = (robot) ->

  robot.hear /(.+)/i, (msg) ->
    return unless Math.random() < 0.003
    text = msg.match[1]
    msg.send "hubot nomulish #{text}"
