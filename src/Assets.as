package {
import flash.filesystem.File;
import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.events.Event;

public class Assets extends Sprite
{

    public static var loadList:List;
    public static var loadLevelsList:LevelsList;
    public static var loadScreenLevel:ScreenLevel;
    public static var assets:AssetManager = new AssetManager ();
    private var _appDir:File = File.applicationDirectory;



    public function Assets() {
        this.addEventListener (Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void
    {

         this.removeEventListener (Event.ADDED_TO_STAGE, onAddedToStage);

            assets.enqueue (_appDir.resolvePath ("assets/"));
            assets.loadQueue (function (ratio1:Number):void {
                if (ratio1 == 1.0) {
                    loadAssets ();
                }
            });
    }

    private function loadAssets():void
    {
        //loadList = new List();
        //addChild(loadList);
        //loadLevelsList = new LevelsList();
        //this.addChild(loadLevelsList);

        loadScreenLevel = new ScreenLevel();
        this.addChild(loadScreenLevel);
    }





//*********************************************
//*********************************************
}
}
