
package {

import feathers.controls.WebView;
public class Webviewer  extends WebView
{
    public function Webviewer()
    {
        var browser:WebView = new WebView();
        browser.width = 800;
        browser.height = 500;;
        this.addChild( browser );
        browser.loadURL("http://www.quackenworth.com/");
    }
}
}
