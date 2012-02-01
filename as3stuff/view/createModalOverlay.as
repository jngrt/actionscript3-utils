/**
 * Created by IntelliJ IDEA.
 * User: jan-geert
 * Date: 24-11-11
 * Time: 13:34
 * To change this template use File | Settings | File Templates.
 */
package as3stuff.view {
import flash.display.Sprite;

public function createModalOverlay(alpha:Number = 0.8):Sprite {
    var screenWidth:Number = 1280;
    var screenHeight:Number = 800;

    var bg:Sprite = new Sprite();
    bg.graphics.beginFill(0, alpha);
    bg.graphics.drawRect(0, 0, screenWidth, screenHeight);
    bg.graphics.endFill();
    return bg;

}

}
