/**
 * Created by IntelliJ IDEA.
 * User: jan-geert
 * Date: 24-11-11
 * Time: 13:34
 * To change this template use File | Settings | File Templates.
 */
package as3stuff.view {
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.filters.DropShadowFilter;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public function createDummyScreen(displayObjectContainer:DisplayObjectContainer, text:String = "...", margin:Number = 40):void {
    var screenWidth:Number = 1280;
    var screenHeight:Number = 800;

    var bg:Sprite = new Sprite();
    bg.graphics.beginFill(0xffffff);
    bg.graphics.drawRect(margin, margin, screenWidth - 2 * margin, screenHeight - 2 * margin);
    bg.graphics.endFill();
    bg.filters = [new DropShadowFilter(2, 45, 0, 0.5, 6, 6)];

    displayObjectContainer.addChild(bg);

    var textField:TextField = new TextField();
    textField.autoSize = TextFieldAutoSize.CENTER;
    textField.defaultTextFormat = new TextFormat("Arial", 30);
    textField.text = text;
    displayObjectContainer.addChild(textField);

    textField.x = screenWidth / 2 - textField.width / 2;
    textField.y = screenHeight / 2 - textField.height / 2;

}
}
