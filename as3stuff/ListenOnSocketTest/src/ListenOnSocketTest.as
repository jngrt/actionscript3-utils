package {

import flash.display.Sprite;
import flash.events.DataEvent;
import flash.events.ErrorEvent;

public class ListenOnSocketTest extends Sprite {
    public var tcpserver:ReceivingTCPServer;

    public function ListenOnSocketTest() {
        tcpserver = new ReceivingTCPServer();
        tcpserver.addEventListener(DataEvent.DATA,dataHandler);
        tcpserver.addEventListener(ErrorEvent.ERROR,errorHandler);
        tcpserver.listen();
    }
    private function dataHandler(event:DataEvent):void{
        trace("Data:"+event.data);
    }
    private function errorHandler(event:ErrorEvent):void{
        trace("Error:"+event.text);
    }
}
}
