electron   = require 'electron'
app        = electron.app
ipc        = electron.ipcMain
controller = null
screen     = null
channel    = null

slack = require('./slack')

app.on 'ready', ->
    console.log 'ready'
    controller = require './controller'

ipc.on 'set-token', (event, token) ->
    slack.setToken(token)

    slack.test (error, info) ->
        if info.ok
            channel = require './channel'
            controller.close()
            controller = null
        else
            controller.webContents.send 'invalid-token'

ipc.on 'set-channel', (event, _channel) ->
    slack.setChannel(_channel)

    screen = require './screen'
    slack.setup(screen)
    channel.close()
    channel = null

ipc.on 'close', ->
	app.quit()

ipc.on 'mini', ->
    controller.minimize() if controller
    channel.minimize() if channel
