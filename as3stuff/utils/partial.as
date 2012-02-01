/**
 * User: jan-geert
 * Date: 1-2-12
 * Time: 15:04
 */
package as3stuff.utils {
public function partial( func : Function, ...boundArgs ) : Function {
    return function( ...dynamicArgs ) : * {
        return func.apply(null, boundArgs.concat(dynamicArgs))
    }
}
}