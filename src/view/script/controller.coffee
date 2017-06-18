top.riot = require 'riot'
top.ipc  = require('electron').ipcRenderer

require './../component/title-bar'
require './../component/token-setting'

window.addEventListener 'load', ->
    riot.mount '*'
, false


