# NOTE: mainプロセスのready後でなければscreenは参照できない
electron	= require('electron')
screen		= electron.screen
display		= screen.getPrimaryDisplay().workArea

window = new electron.BrowserWindow
	height		: display.height,
	width		: display.width,
	resizable	: false,
	frame		: false,
	alwaysOnTop	: true,
	transparent	: true

window.loadURL('file://' + __dirname + '/view/html/screen.html')
window.setIgnoreMouseEvents true

module.exports = window
