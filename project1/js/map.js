var map;
var feature;
function load_map() {
    map = new L.Map('map');
    L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);
    map.attributionControl.setPrefix('');
    map.setView(new L.LatLng(36.925, -4.2056),12);
}
function Search() {
    var latitude = document.getElementById("lati").value;
    var longitude = document.getElementById("longi").value;
    var nzoom = 12;
    var myMarker = L.marker([latitude, longitude], {title: "Coordinates", alt: "Coordinates", draggable: false}).addTo(map).on('dragend', function() {
     var czoom = map.getZoom();
     if(czoom < 18) { nzoom = czoom + 2; }
     if(nzoom > 18) { nzoom = 18; }
     if(czoom != 18) { map.setView(new L.LatLng(latitude,longitude), nzoom); } else { map.setView([latitude,longitude]); }
     myMarker.bindPopup("Lat " + latitude + "<br />Lon " + longitude).openPopup();
    });
}