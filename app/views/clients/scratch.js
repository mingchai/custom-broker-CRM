// Overlays
  
  
  // let destination = {lat: <%= @client.latitude %>, lng: <%= @client.longitude %>};

  // put the distance into a pop-up for each marker
  // let service = new google.maps.DistanceMatrixService;
  //       service.getDistanceMatrix({
  //         origins: origins,
  //         destinations: [destination],
  //         travelMode: 'DRIVING',
  //         unitSystem: google.maps.UnitSystem.METRIC,
  //         avoidHighways: false,
  //         avoidTolls: false
  //       }, function(response, status) {
	// 				console.log('TCL: initMap -> response', response)
  //         if (status !== 'OK') {
  //           alert('Error was: ' + status);
  //         } else { 
  //           let firehalls = response.originAddresses;
  //           let nearBy = document.getElementById('near');
  //           let closeBy = document.getElementById('close');
  //           let farAway = document.getElementById('far');
  //           nearBy.innerHTML = '';
  //           closeBy.innerHTML = '';
  //           farAway.innerHTML = '';
  //           for(let i = 0; i < response.originAddresses.length; i++){
  //             let results = response.rows[i].elements;
  //             firehalls[i]
  //             for(let j = 0; j < results.length; j++){
  //               //console.log(results[j].distance)
  //               if(results[j].distance.value < 2500){
  //                 //console.log(results[j]);
  //                 nearBy.innerHTML += firehalls[i]
  //               }
  //             }
  //           }
  //           }
  //         })


  // let geocoder = new google.maps.Geocoder();
  // geocodeAddress(geocoder, map);
  
  
    
  // let fireHalls = 'https://data.vancouver.ca/download/kml/fire_halls.kmz';
  // let kmlLayer2 = new google.maps.KmlLayer(fireHalls, {
  //     suppressInfoWindows: true,
  //     preserveViewport: true,
  //     map: map
  // });

  // kmlLayer2.addListener('click', function(kmlEvent) {
	// 	console.log('TCL: initMap -> kmlEvent', kmlEvent.latLng)
  //   let text = kmlEvent.featureData.description;
  //   let infowindow = new google.maps.InfoWindow({
  //     content: text
  //   });
  //   infowindow.open(map);
  // });
}

{/* 
<!-- Geocode with Google via DOM -->
function geocodeAddress(geocoder, resultsMap) {
  let clientLocation = (document.getElementById("street_address").innerText) + (document.getElementById("city").innerText) ;
  geocoder.geocode({'address': clientLocation}, function(results, status) {
    if (status === 'OK') {
      resultsMap.setCenter(results[0].geometry.location);
      resultsMap.setZoom(16);
      let marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
} 
*/}