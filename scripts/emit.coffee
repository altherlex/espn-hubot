# Description:
#   Emit function via HTTP GET
#
# URLS:
#   GET /emitter/:emit/:room?
#
# Author:
#   Alther Alves <para.alves@gmail.com>
module.exports = (robot) ->
  robot.router.get '/emitter/:emit/:room?', (req, res) ->
    emit = req.params.emit
    room = req.params.room || '#br-ops'

    try
      robot.emit emit, robot, (m)-> robot.messageRoom(room, m)

    catch err
      # throw new SyntaxError 'Invalid JS code'
      robot.send "Failed to parse GAPI response"
      robot.emit 'error', err

    # message = req.body.message
    # robot.messageRoom room, message
    res.end("Ok! Ckeck up on slack #{room} room")
