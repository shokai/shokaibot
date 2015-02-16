# Description:
#   重要な事なので何回も言う
#
# Author:
#   @shokai

_     = require 'lodash'
async = require 'async'

module.exports = (robot) ->

  robot.respond /iterate\s+(\d+)\s+(.+)$/i, (msg) ->
    count = msg.match[1] - 0
    str = msg.match[2].trim()
    iterate_send str, msg.room, 1, count

  robot.respond /iterate\s+(\d+)(\.{2,3})(\d+)\s+(.+)$/i, (msg) ->
    first = msg.match[1] - 0
    last = msg.match[3] - 0
    if msg.match[2] is '...'
      if first < last
        last -= 1
      else if first > last
        last += 1
    str = msg.match[4].trim()
    iterate_send str,msg.room, first, last

  iterate_send = (str, to, first, last) ->
    async.mapSeries [first..last], (i, next) ->
      compiled = _.template(str) {i: i}
      robot.send {room: to}, "#{compiled}"
      setTimeout next, 300
