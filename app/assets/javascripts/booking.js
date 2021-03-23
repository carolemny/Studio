const bookingBtn = (priceErb) => {
  const price = parseInt(priceErb);
  const startDate = document.getElementById("start_date");
  const endDate = document.getElementById("end_date");
  const viewMore = document.getElementById("view-more");
  const info = document.getElementById("info");
  const btn =  document.getElementById("submit");
  const showTotal = () =>  {
    viewMore.classList.remove("hidden");
  };

  const availableDate = () => {
    info.innerHTML = "";
    const dateToday = new Date(); 
    const date1 = new Date(startDate.value); 
    const date2 = new Date(endDate.value); 
    
    if (date1 < dateToday || date2 < dateToday) {
      info.innerHTML = "La date sélectionnée est passée.";
      return false
    }
    if (date1 > date2 ) {
      info.innerHTML = "La date de départ est antérieure à l'arrivée.";
      return false
    }
    if (isNaN(date1.getTime()) || isNaN(date2.getTime())) {
      return false
    }
    return true;
  };

  const calc = () => {
    const date1 = new Date(startDate.value); 
    const date2 = new Date(endDate.value);
    const diffInTime = date2.getTime() - date1.getTime(); 
    const diffInDays = diffInTime / (1000 * 3600 * 24); 
    const duration = diffInDays + 1;
    const total = duration * price
    
    document.getElementById("duration").innerHTML = `${duration} jours`;
    document.getElementById("total").innerHTML = `${total} €`;
  };
  
  const handleChange = () => {
    btn.disabled = true
    viewMore.classList.add("hidden");
    if (availableDate()) {
      btn.disabled = false;
      calc();
      showTotal();
    };
  };

  startDate.addEventListener('change', handleChange);
  endDate.addEventListener('change', handleChange);
};