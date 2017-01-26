package {

import flash.display.Sprite;
import starling.core.Starling;
import starling.display.Sprite;
import starling.display.Stage;

[SWF (frameRate = "60" ,  width="1024", height="768")]


public class Main extends flash.display.Sprite
{

    private var _starling:Starling;

    public function Main()
    {
        _starling = new Starling(Video, stage);
        _starling.start();

    }
}
}
