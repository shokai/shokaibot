# Description:
#   重要な事なので何回も言う
#
# Author:
#   @shokai

module.exports = (robot) ->

  robot.respond /(\d+)\s+(.+)$/i, (msg) ->

    count = msg.match[1] - 0
    word = msg.match[2].trim()
    for i in [0...count]
      msg.send word
