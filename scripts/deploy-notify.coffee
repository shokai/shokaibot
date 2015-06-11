# Description:
#   デプロイ通知
#
# Author:
#   @shokai


module.exports = (robot) ->

  cid = setInterval ->
    return if typeof robot?.send isnt 'function'
    robot.send {room: "shokai"}, "ガバリ"
    clearInterval cid
  , 1000

  for signal in ['SIGTERM', 'SIGINT']
    process.on signal, ->
      robot.send {room: "shokai"}, 'スヤリ'
      setTimeout process.exit, 1000
