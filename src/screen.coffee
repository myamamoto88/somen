ipc    = require('electron').ipcRenderer
nicoJS = require 'nicojs'

window.addEventListener 'load', ->
    width  = window.innerWidth
    height = window.innerHeight

    nico = new nicoJS
        app       : document.getElementById 'application'
        width     : width
        height    : height
        font_size : 50
        color     : '#fff'
    nico.listen()

    ipc.on 'message', (event, text) ->
        nico.send text
, false
