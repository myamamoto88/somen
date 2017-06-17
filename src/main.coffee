electron = require 'electron'
app      = electron.app
slack    = require './slack'

app.on 'ready', ->
    console.log 'ready'

    screen = require './screen'
    slack.setup(screen)
