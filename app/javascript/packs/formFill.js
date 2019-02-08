console.log('formFill')
let placeSearch,autocomplete;

const formComponents ={
    street_number: "short_name",
    route: "long_name",
    city: "long_name",
    locality: "long_name",
    administrative_area_level_1: "short_name",
    postal_code: "short_name"
}

function initAutocomplete() {
    autocomplete = new google.maps.places.Autocomplete(
        document.getElementById('autocomplete'), {types: ['geocode']});
    autocomplete.setFields('address_components');
    autocomplete.addListener('place_changed', fillInAddress);
    }

function fillInAddress() {
    let place = autocomplete.getPlace();

    for(let component in componentForm){
        console.log(component)
        document.getElementById(component).value = '';
        document.getElementById(component).disabled = false;
    }

    for(let i=0; i < place.address_components.length; i++){
        let addressType = place.address_components[i].types[0];
        if(componentForm[addressType]){
            let val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
        }
    }
}
    
function geolocate() {
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition( position => {
            let geolocation = { lat: position.coords.latitude, lng: position.coords.longitude};
            let circle = new google.maps.Circle({center: geolocation, radius: position.coords.accuracy});
            autocomplete.setBounds(circle.getBounds());
        })
    }
}
