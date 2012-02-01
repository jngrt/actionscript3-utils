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
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public function createDummyObject(displayObjectContainer:DisplayObjectContainer, text:String = "...", x:Number = 0, y:Number = 0, width:Number = 100, height:Number = 100):void {
    displayObjectContainer.x = x;
    displayObjectContainer.y = y;

    var bg:Sprite = new Sprite();
    bg.graphics.beginFill(0x555555);
    bg.graphics.drawRect(0, 0, width, height);
    bg.graphics.endFill();
    displayObjectContainer.addChild(bg);

    var textField:TextField = new TextField();
    textField.autoSize = TextFieldAutoSize.CENTER;
    textField.defaultTextFormat = new TextFormat("Arial", 24);
    textField.text = text;
    displayObjectContainer.addChild(textField);

    textField.x = width / 2 - textField.width / 2;
    textField.y = height / 2 - textField.height / 2;
}

}
