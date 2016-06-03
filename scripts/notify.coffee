module.exports = (robot) ->
  robot.router.post "/notify", (req, res) ->
    console.log(req.body)
    message = req.body.message
    room = req.body.room
    robot.messageRoom room, message
    res.end 'Thanks jenkins!'
