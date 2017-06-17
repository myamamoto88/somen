electron = require 'electron'
app      = electron.app
slack    = require './slack'

app.on 'ready', ->
    console.log 'ready'

    screen  = require('electron').screen
    display = screen.getPrimaryDisplay().workArea

    window = new electron.BrowserWindow({
        height      : display.height,
        width       : display.width,
        resizable   : false,
        frame       : false,
        alwaysOnTop : true,
        transparent : true
    })

    window.loadURL('file://' + __dirname + '/view/html/screen.html')
    window.setIgnoreMouseEvents true

    slack.setup(window)
