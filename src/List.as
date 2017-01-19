package {


import feathers.controls.LayoutGroup;
import feathers.controls.List;
import feathers.controls.List;
import feathers.controls.TabBar;
import feathers.layout.TiledColumnsLayout;

import starling.display.Sprite;
import starling.events.Event;
import feathers.themes.MetalWorksMobileTheme;
import feathers.data.ListCollection;


public class List extends Sprite
{

    private var list:feathers.controls.List;
    private var tabBar:TabBar;

    public function List()
    {
        trace("We're in List land!");
        this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler)
    }

    protected function addedToStageHandler(event:Event):void
    {
        //Adds the mobile theme.
        new MetalWorksMobileTheme();

        //Adds the list to the displaylist
        list = new feathers.controls.List();
        list.setSize(800, 700);
        /*list.width = 800;
        list.height = 700;*/
        list.x = 50;
        list.y = 100;
        this.addChild( list );

        //Adds the data to the list
        var groceryList:ListCollection = new ListCollection(
                [
                    {imageToDisplay: Assets.assets.getTexture("level_1") },
                    {imageToDisplay: Assets.assets.getTexture("level_2") },
                    {imageToDisplay: Assets.assets.getTexture("level_3") },
                    {imageToDisplay: Assets.assets.getTexture("level_4") },
                    {imageToDisplay: Assets.assets.getTexture("level_5") },
                    {imageToDisplay: Assets.assets.getTexture("level_6") },
                    {imageToDisplay: Assets.assets.getTexture("level_7") },
                    {imageToDisplay: Assets.assets.getTexture("level_8") },
                    {imageToDisplay: Assets.assets.getTexture("level_9") },
                    {imageToDisplay: Assets.assets.getTexture("level_10") },


                ]);
        list.dataProvider = groceryList;
        list.itemRendererProperties.iconSourceField = "imageToDisplay";

        //Displays the list in grid
        //var layout:TiledColumnsLayout = new TiledColumnsLayout();

        //list.layout = layout;
        //var container:LayoutGroup = new LayoutGroup();
        //container.layout = layout;

        //this.addChild( list );

        //Add tab bar
        tabBar = new TabBar();

        tabBar.dataProvider = new ListCollection(
                [
                    { label: "Screen 1" },
                    { label: "Screen 2" },

                ]);
        tabBar.x =50;
        tabBar.y= 55;

        tabBar.alignPivot("left","bottom");

        this.addChild(tabBar);

    }


}
}
