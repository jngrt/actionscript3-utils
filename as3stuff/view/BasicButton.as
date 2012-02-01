/**
 * Created by IntelliJ IDEA.
 * User: jan-geert
 * Date: 5-12-11
 * Time: 15:33
 * To change this template use File | Settings | File Templates.
 */
package as3stuff.view {
import flash.display.Sprite;
import flash.filters.DropShadowFilter;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class BasicButton extends Sprite {

    public function BasicButton(gfxClass:Class, dummyText:String = "Button") {
        if (gfxClass)
            addChild(new gfxClass());
        else makeDummy(dummyText);
    }

    public function makeDummy(string:String):void {
        var bg:Sprite = new Sprite();
        bg.graphics.beginFill(0x666666);
        bg.graphics.drawRect(0, 0, 120, 40);
        bg.graphics.endFill();
        bg.filters = [new DropShadowFilter()];
        this.addChild(bg);

        var textField:TextField = new TextField();
        textField.width = 120;
        textField.autoSize = TextFieldAutoSize.CENTER;
        textField.defaultTextFormat = new TextFormat("Arial", 24);
        textField.text = string;
        this.addChild(textField);
    }
}
}
