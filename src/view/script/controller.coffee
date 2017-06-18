top.riot = require 'riot'
top.ipc  = require('electron').ipcRenderer

require './../component/token-setting'

window.addEventListener 'load', ->
    riot.mount '*'
, false


