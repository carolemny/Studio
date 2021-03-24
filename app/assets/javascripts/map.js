const getMap = async (spaces) => {

  let fullAddress = `${spaces[0].address}, ${spaces[0].city}, ${spaces[0].zip_code}, France` 
  let address = document.getElementById('places-search');
  let address2 = address.value.replace(/[ (0-9)]/g, '');

  if (spaces.length && !address2) {
    address2 = spaces[0].fullAddress
  }

  
  const results = await provider.search({ query: fullAddress || 'Paris' });
  
  document.getElementById('map-container').innerHTML = "<div id='map'></div>"
  
  let map = L.map('map').setView([results[0].y, results[0].x], 16);
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { 
    attribution: '© OpenStreetMap contributors',
    maxZoom: 19
  }).addTo(map);

  
  var demo_with_map = new autoComplete({
    selector: '#places-search',
    minChars: 2,
    source: function(term, response) {
      fetch('https://geo.api.gouv.fr/communes?boost=population&fields=centre&nom=' + term)
        .then(function(response) {
          return response.text();
        }).then(function(body) {
          var json = JSON.parse(body);
          var new_json = json.map(function(el) {
            return {
              label: el.nom,
              value: el.code,
              lat: el.centre.coordinates[1],
              lon: el.centre.coordinates[0],
              boundingbox: null
            }
          })
          response(new_json);
        });
    },
    renderItem: function(item, search) {
      search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
      var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
      var optional_bbox_attribute = '';
      if (item.boundingbox) {
        var bbox = [item.boundingbox[2], item.boundingbox[0], item.boundingbox[3], item.boundingbox[1]];
        var optional_bbox_attribute = 'data-bbox="' + bbox.join(',') + '" ';
      }
      return '<div class="autocomplete-suggestion" ' + optional_bbox_attribute +
        'data-lon="' + item.lon + '" data-lat="' + item.lat +
        '" data-val="' + item.label + '">' +
        item.label.replace(re, "<b>$1</b>") +
        '</div>';
    },
    onSelect: function(e, term, item) {
      if (item.getAttribute('data-bbox') && (item.getAttribute('data-bbox').split(',')).length > 0) {
        var extent = item.getAttribute('data-bbox').split(',');
        if (extent.length > 0) {
          extent = extent.map(function(el) {
            return Number(el);
          });
        }
        var bounds = [[extent[1], extent[0]], [extent[3], extent[2]]];

        // zoom the map to the bounds
        map.fitBounds(bounds);
      } else {
        var lat = Number(item.getAttribute('data-lat'));
        var lon = Number(item.getAttribute('data-lon'));
        map.setView(L.latLng(lat, lon), 12);
      }
    }
  });


  spaces.forEach((space) => {
    let marker = L.marker([space.latitude, space.longitude]).addTo(map);
    marker.bindPopup(`<b>${space.title}</b><br>${space.price} € par jour`);
  });

}