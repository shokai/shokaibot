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

  on_sigterm = ->
    robot.send {room: "shokai"}, 'スヤリ'
    setTimeout process.exit, 1000

  if process._events.SIGTERM?
    process._events.SIGTERM = on_sigterm
  else
    process.on 'SIGTERM', on_sigterm
