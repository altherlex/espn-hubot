# Description:
#   Executes shell commands into app server (Heroku)
#
# Commands:
#   hubot shell <shell-cmds> - Displays the app`s dir.
#
# Notes:
#
#
# Author:
#   Alther Alves <para.alves@gmail.com>
child_process = require('child_process')
module.exports = (robot) ->
  robot.hear /shell (.*)/, (res) ->
    bash_cmd = res.match[1]
    child_process.exec bash_cmd, (error, stdout, stderr) ->
      if error
        res.send(error)
      else
        res.send(stdout)  