package {

import flash.display.Sprite;
import starling.core.Starling;
import starling.display.Sprite;
import starling.display.Stage;


public class Main extends flash.display.Sprite
{

    private var _starling:Starling;

    public function Main()
    {
        _starling = new Starling(Assets, stage);
        _starling.start();

    }
}
}
