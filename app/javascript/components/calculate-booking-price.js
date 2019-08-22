const start_date = document.querySelector("#start_date")
const end_date = document.querySelector("#end_date")
const kitchenPrice = document.querySelector("#new_booking")
const bookingResult = document.querySelector("#booking-price-result")


const calculateBooking = () => {
  start_date.addEventListener('change', (event) => {
    if (end_date.value !== "") {
      const startDateAsDate = new Date(start_date.value.split(' to ')[0]);
      const endDateAsDate = new Date(start_date.value.split(' to ')[1]);
      let dateInDays = ((endDateAsDate - startDateAsDate) / 86400000) + 1;
        if (dateInDays > 0) {
        } else {
          dateInDays = 1;
        }
      const bookingPrice = kitchenPrice.dataset.price * dateInDays
      bookingResult.insertAdjacentHTML("beforeend", `<h4>Prix total de la réservation: ${bookingPrice}€</h4>`)
    }
  });
}


export { calculateBooking };

