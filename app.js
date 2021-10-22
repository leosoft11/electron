const { app, BrowserWindow } = require('electron');

require('update-electron-app')();

const createWindow = () => {
    let win = new BrowserWindow({
        width: 800,
        height: 800,
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false,
            enableRemoteModule: true
        }
    })
    win.loadFile('index.html');
}


app.on('ready', createWindow);