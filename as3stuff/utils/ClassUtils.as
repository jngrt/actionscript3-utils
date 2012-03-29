/**
 * Created by IntelliJ IDEA.
 * User: jan-geert
 * Date: 13-12-11
 * Time: 14:55
 * To change this template use File | Settings | File Templates.
 */
package as3stuff.utils {
import flash.utils.getQualifiedClassName;

public class ClassUtils {

    public static function getClassName(object:*):String {
        var className:String = getQualifiedClassName(object);
        if( className.lastIndexOf("::")>-1)
            className = className.slice(className.lastIndexOf("::") + 2);

        return className;
    }
}
}
