# Description:
#   Gazeta scripts for knows about Gazeta FTP.
#
# Commands:
#   hubot 5 files do FTP da Gazeta - Displays latest 5 files from Gazeta FTP (GET '/emitter/ftp_gazeta' to emit on HTTP).
#
# Notes:
#    You can make any phrase with two key words: files and gazeta
#    If the phrase include a number. It will recognize as file number

module.exports = (robot) ->
  robot.on "ftp_gazeta", (res, callback_to_send) ->
    callback_to_send "I`m trying to connect on Gazeta FTP. Wait a moment please..."

    count_files = 10
    if res.message and res.message.text and res.message.text.match(/\d+/)
      count_files = res.message.text.match(/\d+/)[0] 

    JSFtp = require("jsftp")

    ftp = new JSFtp({
      host: process.env.HUBOT_FTP_HOST,
      user: process.env.HUBOT_FTP_USER,
      pass: process.env.HUBOT_FTP_PASS
    })

    ftp.list ".", (err, response) ->
      if err
        callback_to_send 'I got an error: ' + err.message
      else
        files = []
        result = response.split('.xml').splice(-(+count_files+1)).join('.xml ')
        callback_to_send "The latest #{count_files} files are..."
        callback_to_send result

  # Catching all message
  robot.catchAll (msg) ->
    if msg.message.text.match(/gazeta/) and msg.message.text.match(/files/)
      robot.emit "ftp_gazeta", msg, (m)-> msg.send(m)
    # else
    #   msg.send "I don't know how to react to: #{msg.message.text}"



  #
  # robot.hear /I like pie/i, (res) ->
  #   res.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (res) ->
  #   res.send res.random lulz
  #
  # robot.topic (res) ->
  #   res.send "#{res.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (res) ->
  #   setTimeout () ->
  #     res.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'
