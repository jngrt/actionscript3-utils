/**
 * User: jan-geert
 * Date: 1-2-12
 * Time: 15:04
 */
package as3stuff.utils {
public class Curry{

    public static function left( func : Function, ...boundArgs ) : Function {
        return function( ...dynamicArgs ) : * {
            return func.apply(null, boundArgs.concat(dynamicArgs))
        }
    }
    public static function right( func : Function, ...boundArgs ) : Function {
        return function( ...dynamicArgs ) : * {
            return func.apply(null, dynamicArgs.concat(boundArgs))
        }
    }
}
}