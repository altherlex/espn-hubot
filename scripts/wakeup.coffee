# Description:
#   Send OK when invoked.
#
# URLS:
#   GET /wakeup
#
# Notes:
#   This command is start Heroku Dynos
#
# Author:
#   Alther Alves <para.alves@gmail.com>
module.exports = (robot) ->
  robot.router.get "/wakeup", (req, res) ->
    res.setHeader 'content-type', 'text/html'
    res.end 'Ops... I`m here again.'