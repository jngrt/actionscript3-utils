/**
 * User: jan-geert
 * Date: 19-1-12
 * Time: 14:37
 */
package as3stuff.net {

import flash.events.Event;
import flash.events.ErrorEvent;
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
        
        if(onSuccess)
            loader.addEventListener(Event.COMPLETE,function(e:Event){
                onSuccess(JSON.parse((e.target as URLLoader).data));
            });
        if(onError){
            loader.addEventListener(IOErrorEvent.IO_ERROR,function(e:ErrorEvent){
                onError(e.text);
            });
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(e:ErrorEvent){
                onError(e.text);
            });
        }
        loader.load(req);   
    }
}
}