
// setup the video element and attach it to the Dash player
function setupVideo() {
  var url = "http://wams.edgesuite.net/media/MPTExpressionData02/BigBuckBunny_1080p24_IYUV_2ch.ism/manifest(format=mpd-time-csf)";
  var context = new Dash.di.DashContext();
  var player = new MediaPlayer(context);
                  player.startup();
                  player.attachView(document.querySelector("#videoplayer"));
                  player.attachSource(url);
}
