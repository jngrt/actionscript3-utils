/**
 * User: jan-geert
 * Date: 23-1-12
 * Time: 12:59
 */
package as3stuff.net {

import flash.events.*;
import flash.net.ServerSocket;
import flash.net.Socket;
import flash.utils.ByteArray;

public class ReceivingTCPServer extends EventDispatcher {

    protected var serverSocket:ServerSocket;

    public function listen(port:Number=80):void
    {
        try {
            serverSocket = new ServerSocket();
            serverSocket.addEventListener(Event.CONNECT, socketConnectHandler);
            serverSocket.bind(port);
            serverSocket.listen();
            //trace("Listening on port " + port + "...\n");
        } catch (error:Error) {
            dispatchEvent( new ErrorEvent(ErrorEvent.ERROR,false,false,
                    "ReceivingTCPServer, bind error: Port "+ port+ " may be in use. ("+error.message +")"));
        }
    }

    protected function socketConnectHandler(event:ServerSocketConnectEvent):void
    {
        var socket:Socket = event.socket;
        socket.addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
    }

    protected function socketDataHandler(event:ProgressEvent):void
    {
        try {
            var socket:Socket = event.target as Socket;
            var bytes:ByteArray = new ByteArray();
            socket.readBytes(bytes);
            var request:String = "" + bytes;
            if( request.charCodeAt(0) == 2 && request.charCodeAt(request.length-1) == 3 ){
                dispatchEvent( new DataEvent(DataEvent.DATA,false,false,request.substring(1,request.length-1)));
            }else{
                dispatchEvent( new ErrorEvent(ErrorEvent.ERROR,false,false,
                            "ReceivingTCPServer Error, request is not welformed message. Use <STX>Message<ETX>"));
            }
            //trace("start char:"+request.charCodeAt(0));
            //trace("end char:"+request.charCodeAt(request.length-1));
            //trace("request:"+ request);
            socket.writeUTFBytes(String.fromCharCode(6));
            socket.flush();
            socket.close();
        } catch (error:Error) {
            dispatchEvent( new ErrorEvent(ErrorEvent.ERROR,false,false,
                    "ReceivingTCPServer, data handler error. ("+error.message +")"));

        }
    }



}
}