import * as  net from 'net';
import * as  http from 'http';

let host = 'localhost';
let port1 = '8086';

let server = net.createServer();
console.log('...')
server.listen(port1, () => console.log('tcpip ok'));

server.on('connection', function (socket) {

    console.log('connected!');



})

let port2 = '8087';

let httpServer = http.createServer((request, response) => {
    let headers = request.headers;
    let isOk = true;
    if (request.method !== 'GET') isOk = false;
    if (headers.connection !== 'Upgrade') isOk = false;
    if (headers.upgrade !== 'websocket') isOk = false;
    if (Number(request.httpVersion) < 1.1) isOk = false;
    if (!headers.origin) isOk = false;


    response.setHeader()

    console.log(request);
    console.log('isOK:',isOk);

});
httpServer.listen(port2, () => console.log('http ok'));

// httpServer.on('connection',function(socket){
//     console.log(socket);
//     console.log('http connected!');
// })