// Locate the the broker - best for face-to-face meetings
function geolocate() {
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition( position => {
            let geolocation = { lat: position.coords.latitude, lng: position.coords.longitude};
        })
    }
}

geolocate();