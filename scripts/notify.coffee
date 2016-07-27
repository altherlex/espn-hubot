# Description:
#   Send message to chatroom using HTTP POST
#
# URLS:
#   POST /hubot/notify/<room> (message=<message>)
#
# Author:
#   Alther Alves <para.alves@gmail.com>
module.exports = (robot) ->
  robot.router.post "/notify", (req, res) ->
    console.log(req.body)
    message = req.body.message
    room = req.body.room
    robot.messageRoom room, message
    res.end 'Thanks jenkins!'

  robot.router.get "/notify", (req, res) ->
    console.log(req.body)
    message = req.body.message
    room = req.body.room
    robot.messageRoom room, message
    res.end 'Thanks jenkins!'

  robot.router.post '/hubot/notify/:room', (req, res) ->
    room = req.params.room
    message = req.body.message
    robot.messageRoom room, message
    res.end()

  robot.router.get '/hubot/notify/:room', (req, res) ->
    res.setHeader 'content-type', 'text/html'
    room = req.params.room
    res.end 'Room:'+room    