/**
 * Created by davidhollaway on 1/26/17.
 */
package {

import feathers.media.VideoPlayer

public class Video extends VideoPlayer

{
    public function Video()
    {

        var player:VideoPlayer = new VideoPlayer();
        player.setSize( 320, 300 );
        this.addChild( player );
        player.videoSource("http://example.com/video.m4v");
    }
}
}
