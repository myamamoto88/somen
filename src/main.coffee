electron = require 'electron'
app = electron.app

app.on 'ready', ->
    # slack client の初期化をする
    console.log 'Initialize'

app.on 'window-all-closed', ->
    app.quit
