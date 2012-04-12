/**
 * User: jan-geert
 * Date: 19-1-12
 * Time: 14:37
 */
package as3stuff.net {

import com.demonsters.debugger.MonsterDebugger;

import flash.events.Event;
import flash.events.ErrorEvent;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class RESTHelper {
    /**
     *
     * @param url
     * @param method, see URLRequestMethod
     * @param data
     * @param onSuccess
     * @param onError
     */
    public static function doRequest(url:String, method:String, data:Object = null, onSuccess:Function =null,onError:Function = null):void{
        var req:URLRequest = new URLRequest(url);
        req.method = method;
        if(data)
            req.data = JSON.stringify(data);
        
        var loader:URLLoader = new URLLoader();
        var statusCode:int;

        loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, function(e:HTTPStatusEvent){
            statusCode = e.status;
        });

        if(onSuccess)
            loader.addEventListener(Event.COMPLETE,function(e:Event){
                onSuccess({code:statusCode, data:JSON.parse((e.target as URLLoader).data)});
            });
        if(onError){
            loader.addEventListener(IOErrorEvent.IO_ERROR,function(e:ErrorEvent){
                onError({code:statusCode, message:e.text});
            });
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(e:ErrorEvent){
                onError({code:statusCode, message:e.text});
            });
        }
        loader.load(req);   
    }
}
}