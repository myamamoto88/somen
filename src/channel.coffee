electron = require('electron')

window = new electron.BrowserWindow
	height		: 500,
	width		: 400,
	resizable	: false,
	frame		: false,
	transparent	: true

window.loadURL('file://' + __dirname + '/view/html/channel.html')

module.exports = window
