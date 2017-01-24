package {


import feathers.controls.AutoSizeMode;
import feathers.controls.Button;
import feathers.controls.Header;
import feathers.controls.List;
import feathers.controls.Panel;
import feathers.controls.Screen;
import feathers.controls.ScrollPolicy;
import feathers.controls.TabBar;
import feathers.controls.renderers.DefaultListItemRenderer;
import feathers.controls.renderers.IListItemRenderer;
import feathers.controls.text.TextBlockTextRenderer;
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
import feathers.themes.BaseMetalWorksMobileTheme;
import feathers.themes.MetalWorksMobileTheme;
import flash.geom.Rectangle;
import flash.text.TextFormat;
import flash.text.engine.ElementFormat;
import flash.text.engine.FontDescription;
import flash.text.engine.FontPosture;
import flash.text.engine.FontWeight;
import starling.display.DisplayObject;
import starling.display.Image;
import starling.display.Quad;
import starling.events.Event;


public class LevelsList extends Screen
{
    private var list:feathers.controls.List;
	private var panel:Panel;
    private var tabBar:TabBar;

    public function LevelsList()
    {
    }
	
	override protected function initialize():void 
	{
		super.initialize();
		
		autoSizeMode = AutoSizeMode.STAGE;
		this.backgroundSkin = new Quad(8,8,0xffffff);
		layout = new VerticalLayout;
		(layout as VerticalLayout).padding = 16;
		
		panel = new Panel;
		panel.headerFactory = headerFunction;
		panel.layoutData = new VerticalLayoutData(100, 100);
		panel.backgroundSkin = new Image( Assets.assets.getTexture("bluebg") );
		(panel.backgroundSkin as Image).scale9Grid = new Rectangle(12, 12, 62,62);
		panel.layout = new VerticalLayout;
		addChild(panel);
		
		tabBar = new TabBar();
        tabBar.dataProvider = new ListCollection([{ label: "Screen 1" },{ label: "Screen 2" }]);
        panel.addChild(tabBar);
		
		list = new feathers.controls.List();
		list.layoutData = new VerticalLayoutData(100, 100);
		list.backgroundSkin = new Image( Assets.assets.getTexture("red_square") );// new Quad( 8, 8, 0xffffff );
		list.verticalScrollPolicy = ScrollPolicy.OFF;
		list.horizontalScrollPolicy = ScrollPolicy.OFF;
		list.itemRendererFactory = rendererFunction;
        panel.addChild( list );

		var data:Array = [];
		for (var i:int = 1; i < 15; i++) data.push({label:i.toString()});
		
		list.dataProvider = new ListCollection(data);

        var listLayout:TiledRowsLayout = new TiledRowsLayout();
		(listLayout as TiledRowsLayout).tileHorizontalAlign = HorizontalAlign.JUSTIFY;
		(listLayout as TiledRowsLayout).tileVerticalAlign = VerticalAlign.JUSTIFY;
		(listLayout as TiledRowsLayout).requestedColumnCount = 5;
		(listLayout as TiledRowsLayout).requestedRowCount = 3;
		(listLayout as TiledRowsLayout).padding = 16;
		(listLayout as TiledRowsLayout).gap = 16;
		(listLayout as TiledRowsLayout).distributeWidths = true;
		(listLayout as TiledRowsLayout).distributeHeights = true;
        list.layout = listLayout;
	}
	
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
	
	private function labelFunction():ITextRenderer
	{
		var t:TextBlockTextRenderer = new TextBlockTextRenderer();
		var font:FontDescription = new FontDescription(BaseMetalWorksMobileTheme.FONT_NAME);
		var format:ElementFormat = new ElementFormat( font, 52, 0xffffff );
		//format.
		t.elementFormat = format;
		return t;
	}

	private function headerFunction():IFeathersControl
	{
		var header:Header = new Header;
		header.backgroundSkin = new Quad(8,8,0xffffff);
		header.paddingBottom = -8;
		header.height = 0;
		var closeButton:Button = new Button;
		closeButton.defaultSkin = new Image( Assets.assets.getTexture("close") );
		closeButton.setSize(24, 24);
		closeButton.addEventListener( Event.TRIGGERED, closeHandler );
		
		header.rightItems = new Vector.<DisplayObject>;
		header.rightItems.push(closeButton);
		return header;
	}
	
	private function closeHandler(e:*=null):void 
	{
		removeFromParent();
	}

}
}
