module.exports = (robot) ->

  robot.router.post '/littlebits', (req, res) ->

    res.end 'ok'

    if req.body.type isnt 'amplitude'
      robot.logger.error 'invalid data'
      return

    percent = req.body.payload.percent
    if percent > 80
      robot.send {room: 'shokai'}, "わいわい (#{percent})"
      return
