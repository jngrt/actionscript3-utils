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

public function createDummyDialog(displayObjectContainer:DisplayObjectContainer, text:String = "...", margin:Number = 40):Sprite {
    var screenWidth:Number = 1280;
    var screenHeight:Number = 800;

    var bg:Sprite = new Sprite();
    bg.graphics.beginFill(0, 0.5);
    bg.graphics.drawRect(0, 0, screenWidth, screenHeight);
    bg.graphics.endFill();


    var textField:TextField = new TextField();
    textField.autoSize = TextFieldAutoSize.CENTER;
    textField.defaultTextFormat = new TextFormat("Arial", 30);
    textField.text = text;
    displayObjectContainer.addChild(textField);

    textField.x = screenWidth / 2 - textField.width / 2;
    textField.y = screenHeight / 2 - textField.height / 2;

}

}
