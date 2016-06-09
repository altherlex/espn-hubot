# Description:
#   Displays the version of hubot
#
# Commands:
#   hubot version - Displays the hubot`s version.
#
# Author:
#   Alther Alves <para.alves@gmail.com>
module.exports = (robot) -> 
  robot.hear /version/i, (res) ->
    res.send "v1.3"
