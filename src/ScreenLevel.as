
package {

import feathers.controls.AutoSizeMode;
import feathers.controls.Button;
import feathers.controls.Header;
import feathers.controls.List;
import feathers.controls.Panel;
import feathers.controls.Screen;
import feathers.controls.ScrollPolicy;
import feathers.controls.TabBar;
import feathers.controls.ToggleButton;
import feathers.controls.renderers.DefaultListItemRenderer;
import feathers.controls.renderers.IListItemRenderer;
import feathers.controls.text.TextBlockTextRenderer;
import feathers.core.FeathersControl;
import feathers.core.IFeathersControl;
import feathers.core.ITextRenderer;
import feathers.data.ListCollection;
import feathers.layout.HorizontalAlign;
import feathers.layout.RelativePosition;
import feathers.layout.TiledColumnsLayout;
import feathers.layout.TiledRowsLayout;
import feathers.layout.VerticalAlign;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;
import feathers.skins.ImageSkin;
import feathers.themes.BaseMetalWorksMobileTheme;
import feathers.themes.MetalWorksMobileTheme;
import flash.geom.Rectangle;
import flash.text.TextFormat;
import flash.text.engine.ElementFormat;
import flash.text.engine.FontDescription;
import flash.text.engine.FontPosture;
import flash.text.engine.FontWeight;

import starling.core.Starling;
import starling.display.Button;
import starling.display.DisplayObject;
import starling.display.Image;
import starling.display.Quad;
import starling.events.Event;

public class ScreenLevel extends Screen
{
    private var panel:feathers.controls.Panel;
    private var list:feathers.controls.List;
    private var tabBar:feathers.controls.TabBar;
    private var background:starling.display.Image;
    private var closeButton:starling.display.Button;

    public function ScreenLevel()
    {

        //this.addEventListener(Event.ADDED_TO_STAGE, drawScreen)
    }

    override protected function initialize():void
    {
        super.initialize();
        trace("*************** Hello this is the Levels Screen ***************");
        background = new Image(Assets.assets.getTexture("backgroundJungle"));
        addChild(background);
        //new MetalWorksMobileTheme();
        panel = new Panel();
        //panel.headerFactory = headerFunction; //adds the close button but I don't think I need this. Add Starling button instead.
        panel.backgroundSkin = new Image(Assets.assets.getTexture("bluebg"));
        panel.layoutData = new VerticalLayoutData(100, 100);
        panel.layout = new VerticalLayout();
        panel.x = 40;
        panel.y = 100;
        addChild(panel);

        /*panel.headerFactory = headerFunction;
        panel.layoutData = new VerticalLayoutData(100, 100);
        panel.backgroundSkin = new Image( Assets.assets.getTexture("bluebg") );
        (panel.backgroundSkin as Image).scale9Grid = new Rectangle(12, 12, 62,62);
        panel.layout = new VerticalLayout;
        addChild(panel);*/

        tabBar = new TabBar();
        tabBar.dataProvider = new ListCollection(
        [
            { label: "Screen 1" },
            { label: "Screen 2" }
        ]);
        panel.addChild(tabBar);

        //Skins the first tab
        tabBar.firstTabFactory = function():ToggleButton
        {
            var tab:ToggleButton = new ToggleButton();

            //skin the tab here, if not using a theme
            var skin:ImageSkin = new ImageSkin(Assets.assets.getTexture("yellowtab") );
            skin.scale9Grid = new Rectangle( 2, 3, 1, 6 );
            tab.defaultSkin = skin;
            //tab.fontStyles = new TextFormat( "Helvetica", 20, 0x3c3c3c );

            return tab;
        };

        //Skins the last tab.
        tabBar.lastTabFactory = function():ToggleButton
        {
            var tab:ToggleButton = new ToggleButton();

            //skin the tab here, if not using a theme
            var  skin:ImageSkin = new ImageSkin(Assets.assets.getTexture("whitetab") );
            skin.scale9Grid = new Rectangle( 2, 3, 1, 6 );
            tab.defaultSkin = skin;
            //tab.fontStyles = new TextFormat( "Helvetica", 20, 0x3c3c3c );

            return tab;
        };



        list = new feathers.controls.List();
        list.layoutData = new VerticalLayoutData(100,100);
        list.verticalScrollPosition = ScrollPolicy.OFF;
        list.horizontalScrollPolicy = ScrollPolicy.ON;
        list.itemRendererFactory = rendererFunction;
        panel.addChild(list);

       /* list = new feathers.controls.List();
        list.layoutData = new VerticalLayoutData(100, 100);
        list.backgroundSkin = new Image( Assets.assets.getTexture("red_square") );// new Quad( 8, 8, 0xffffff );
        list.verticalScrollPolicy = ScrollPolicy.OFF;
        list.horizontalScrollPolicy = ScrollPolicy.OFF;
        list.itemRendererFactory = rendererFunction;
        panel.addChild( list );*/

        closeButton = new starling.display.Button(Assets.assets.getTexture("close"));
        this.addChild(closeButton);
        closeButton.x = panel.width;
        closeButton.y = panel.y;
    }

    //Adds items to the list;
    private function rendererFunction():IListItemRenderer
    {
        var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();

        //renderer.styleProvider = null;
        renderer.upIcon = new Image( Assets.assets.getTexture("locked") );
        renderer.iconPosition = RelativePosition.BOTTOM;
        renderer.horizontalAlign = HorizontalAlign.CENTER;
        renderer.verticalAlign = VerticalAlign.MIDDLE;
        renderer.labelFactory = labelFunction;
        //renderer.defaultLabelProperties.elementFormat = new TextFormat( BaseMetalWorksMobileTheme.FONT_NAME, 38, 0xffffff);
        (renderer.upIcon as Image).width = 32;
        (renderer.upIcon as Image).height = 32;
        renderer.defaultSkin = new Image( Assets.assets.getTexture("greenbg") );
        (renderer.defaultSkin as Image).scale9Grid = new Rectangle(11,11,11,11);

        return renderer;
    }

    //Adds the Close button throug the header - Function for the header on the panel and the close button
    //Do I need this. Just add a Starling button.
    /*private function headerFunction():IFeathersControl
    {
        var header:Header = new Header();
        header.backgroundSkin = new Quad(8,8,0xffffff);
        header.paddingBottom = -8;
        header.height = 0;

        var closeButton:Button = new Button;
        //sets the image of the button
        closeButton.defaultSkin = new Image( Assets.assets.getTexture("close") );

        closeButton.setSize(44, 44); //setSize() - Sets both the width and the height of the control in a single function call.
        closeButton.addEventListener(Event.TRIGGERED, closeHandler);
        header.rightItems = new Vector.<DisplayObject>;
        header.rightItems.push(closeButton);

        return header;
    }*/

    private function closeHandler(event:Event):void
    {
     trace("You clicked the close buttton!!!");
    }






//**********************************************************
//**********************************************************
}
}
