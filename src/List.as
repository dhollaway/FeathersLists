package {


import starling.display.Sprite;
import starling.events.Event;
import feathers.themes.MetalWorksMobileTheme;

public class List extends Sprite
{

 public function List()
    {
        trace("We're in List land!");
        this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler)
    }

    protected function addedToStageHandler(event:Event):void
    {
        new MetalWorksMobileTheme();


    }


}
}
