/**
 * User: jan-geert
 * Date: 4-1-12
 * Time: 13:42
 */
package as3stuff.view {
import fl.text.TLFTextField;

import flash.display.Stage;

public class TextFieldHelper {
    public static function setFocusEnableCursor(tlf:TLFTextField):void{
        //tlf.textFlow.interactionManager.setFocus();
        /*
        tlf.selectable = true;
        tlf.text += " ";
        tlf.stage.focus = tlf;
        tlf.setSelection(tlf.length-1,tlf.length);
        tlf.text = tlf.text.substr(0,tlf.length-1);
        */
    }
}
}