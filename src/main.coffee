electron   = require 'electron'
app        = electron.app
ipc        = electron.ipcMain
controller = null

Slack = require('./slack').Slack
slack = new Slack()

app.on 'ready', ->
    console.log 'ready'
    controller = require './controller'

ipc.on 'set-token', (event, token) ->
    slack.set_token(token)

    slack.test (error, info) ->
        if info.ok
            screen = require './screen'
            slack.setup(screen)
            controller.close()
        else
            controller.webContents.send 'invalid-token'
