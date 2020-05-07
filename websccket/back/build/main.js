"use strict";
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
var net = __importStar(require("net"));
var http = __importStar(require("http"));
var host = 'localhost';
var port1 = '8086';
var server = net.createServer();
console.log('...');
server.listen(port1, function () { return console.log('tcpip ok'); });
server.on('connection', function (socket) {
    console.log('connected!');
});
var port2 = '8087';
var httpServer = http.createServer(function (request, response) {
    var headers = request.headers;
    var isOk = true;
    if (request.method !== 'GET')
        isOk = false;
    if (headers.connection !== 'Upgrade')
        isOk = false;
    if (headers.upgrade !== 'websocket')
        isOk = false;
    if (Number(request.httpVersion) < 1.1)
        isOk = false;
    if (!headers.origin)
        isOk = false;
    console.log(request);
    console.log('isOK:', isOk);
});
httpServer.listen(port2, function () { return console.log('http ok'); });
// httpServer.on('connection',function(socket){
//     console.log(socket);
//     console.log('http connected!');
// })
