const getMap = async (spaces) => {
  const fullAddress = `${spaces[0].address}, ${spaces[0].city}, ${spaces[0].zip_code}, France` 

  const results = await provider.search({ query: fullAddress });

  document.getElementById('map-container').innerHTML = "<div id='map'></div>"

  let map = L.map('map').setView([results[0].y, results[0].x], 16);

  let osmLayer = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { 
    attribution: '© OpenStreetMap contributors',
    maxZoom: 19
  });

  map.addLayer(osmLayer);

  spaces.forEach((space) => {
    console.log(space);
    let marker = L.marker([space.latitude, space.longitude]).addTo(map);
    marker.bindPopup(`<b>${space.title}</b><br>${space.price} € par jour`);
  });

}