var initMap = function() {
  var provider = new com.modestmaps.TemplatedLayer('http://tile.openstreetmap.org/{Z}/{X}/{Y}.png');
  var map = new com.modestmaps.Map('map', provider, new com.modestmaps.Point(600,400));
  var canvas = document.createElement('canvas');
  canvas.style.position = 'absolute';
  canvas.style.left = '0';
  canvas.style.top = '0';
  canvas.width = map.dimensions.x;
  canvas.height = map.dimensions.y;
  map.parent.appendChild(canvas);
 
  var locations = [];
  var paths = [];
    function addPath(a, b) {
        locations.push(a);
        locations.push(b);
        var newPath = []

        for (var i = 0; i <= 100; i++) {
            var f = i/100.0;
            newPath.push(com.modestmaps.Location.interpolate(a, b, f));
        }
        paths.push(newPath);
    }
    
// servers
    var s_us = new com.modestmaps.Location(38.8951, -77.0367);
    var s_eu = new com.modestmaps.Location(48.8567, 2.3508);
    var s_as = new com.modestmaps.Location(35.6895, 139.6917);
// end of servers
// client locations
    var c_ar = new com.modestmaps.Location(-34.58750, -58.6725);
    var c_de = new com.modestmaps.Location(52.36670, 14.06669);
    var c_ca = new com.modestmaps.Location(46.61670, -72.6667);
    var c_br = new com.modestmaps.Location(-10, -55);
    var c_gr = new com.modestmaps.Location(39, 22);
    var c_gb = new com.modestmaps.Location(51.5, -0.12999);
    var c_cn = new com.modestmaps.Location(23.11670, 113.25);
    var c_us1 = new com.modestmaps.Location(38, -97);

// PATHS

    addPath(c_ar, s_us);
    addPath(c_de, s_eu);
    addPath(c_ca, s_us);
    addPath(c_br, s_us);
    addPath(c_gr, s_eu);
    addPath(c_gb, s_eu);
    addPath(c_cn, s_as);
    addPath(c_us1, s_us);

//    addPath(sf, athens);
//    addPath(athens, sf);
//    addPath(kek, athens);
    map.setExtent(locations);
 
  function redraw() {
    var ctx = canvas.getContext('2d');
    ctx.clearRect(0,0,canvas.width,canvas.height);
    ctx.strokeStyle = '#404040';
      for (var l = 0; l < paths.length; l++) {
        var path = paths[l];
        ctx.beginPath();
        var p = map.locationPoint(path[0]);
        ctx.moveTo(p.x,p.y);
        for (var i = 1; i < path.length; i++) {
          p = map.locationPoint(path[i]);
          ctx.lineTo(p.x,p.y);
        }
        ctx.stroke();   
      }
  }
 
  map.addCallback('drawn', redraw);
  map.addCallback('resized', function() {
    canvas.width = map.dimensions.x;
    canvas.height = map.dimensions.y;
    redraw();
  });
 
  redraw();
}

initMap();