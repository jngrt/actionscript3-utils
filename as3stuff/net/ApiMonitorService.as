/**
 * User: jan-geert
 * Date: 29-2-12
 * Time: 11:30
 */
package as3stuff.net {

import air.net.URLMonitor;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.StatusEvent;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;

public class ApiMonitorService extends EventDispatcher {
    public var monitor:URLMonitor;

    public function init(url:String):void {

        var ur:URLRequest = new URLRequest(url);
        ur.method = URLRequestMethod.HEAD;
        monitor = new URLMonitor(ur);
        var lastState:Boolean = monitor.available;

        monitor.addEventListener(StatusEvent.STATUS, function (event:StatusEvent):void {
            if (monitor.available != lastState) {
                lastState = monitor.available;
                dispatchEvent(new Event(monitor.available ? Event.OPEN : Event.CLOSE));
            }
        });
        monitor.start();
    }
}
}