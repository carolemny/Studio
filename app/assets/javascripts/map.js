const getMap = async (spaces) => {

  let address = document.getElementById('places-search');
  const results = await provider.search({ query: address.value || 'Paris' });
  if (!results[0]) {
    document.getElementById('info-map').innerHTML = `<p class="my-text-primary"><small>La ville est mal renseignée. Merci d'utiliser l'autocomplétion.</small><p>`;
  } else {
    document.getElementById('info-map').innerHTML = ``;
  }

  document.getElementById('map-container').innerHTML = "<div id='map'></div>";

  let map = L.map('map').setView([results[0].y, results[0].x], 13);
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { 
    attribution: '© OpenStreetMap contributors',
    maxZoom: 19
  }).addTo(map);
  
  
  new autoComplete({
    selector: '#places-search',
    minChars: 2,
    source: function(term, response) {
      fetch('https://geo.api.gouv.fr/communes?boost=population&fields=centre&nom=' + term)
      .then(function(response) {
        return response.text();
      }).then(function(body) {
        let json = JSON.parse(body);
        let new_json = json.map(function(el) {
          return {
            label: el.nom,
            value: el.code,
            boundingbox: null
          }
        })
        response(new_json);
      });
    },
    renderItem: function(item, search) {
      search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
      let re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
      let optional_bbox_attribute = '';
      if (item.boundingbox) {
        let bbox = [item.boundingbox[2], item.boundingbox[0], item.boundingbox[3], item.boundingbox[1]];
        let optional_bbox_attribute = 'data-bbox="' + bbox.join(',') + '" ';
      }
      return '<div class="autocomplete-suggestion" ' + optional_bbox_attribute +
      'data-lon="' + item.lon + '" data-lat="' + item.lat +
      '" data-val="' + item.label + '">' +
      item.label.replace(re, "<b>$1</b>") +
      '</div>';
    },
  });


  if (!spaces[0]) {
    document.getElementById('info-map').innerHTML = `<p class="my-text-primary"><small>Il n'y a pas encore d'espaces dans cette ville.</small><p>`;
  } else {
    document.getElementById('info-map').innerHTML = ``;
  }

  spaces.forEach((space) => {
    let marker = L.marker([space.latitude, space.longitude], {
      icon: L.divIcon({
        html: '<i class="fas fa-map-marker-alt" style="color: #FF2D00; font-size: 30px;"></i>',
        iconSize: [20, 70],
        className: 'myDivIcon'
      }) 
    }).addTo(map);
    marker.bindPopup(`<b>${space.title}</b><br>${space.price} € par jour`);
  });

}



const auto = async (spaces) => { 
  new autoComplete({
    selector: '#places-search',
    minChars: 2,
    source: function(term, response) {
      fetch('https://geo.api.gouv.fr/communes?boost=population&fields=centre&nom=' + term)
      .then(function(response) {
        return response.text();
      }).then(function(body) {
        let json = JSON.parse(body);
        let new_json = json.map(function(el) {
          return {
            label: el.nom,
            value: el.code,
            zip: el.code,
            boundingbox: null,
          }
        })
        response(new_json);
      });
    },
    renderItem: function(item, search) {
      search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
      let re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
      let optional_bbox_attribute = '';
      if (item.boundingbox) {
        let bbox = [item.boundingbox[2], item.boundingbox[0], item.boundingbox[3], item.boundingbox[1]];
        let optional_bbox_attribute = 'data-bbox="' + bbox.join(',') + '" ';
      }
      return '<div class="autocomplete-suggestion" ' + optional_bbox_attribute +
      'data-lon="' + item.lon + '" data-zip="' + item.zip +
      '" data-val="' + item.label + '">' +
      item.label.replace(re, "<b>$1</b>") +
      '</div>';
    },
    onSelect: function(item) {
      const input = document.getElementById('zip-code');
      input.value = item.target.attributes[2].value
    }
  });
  
}