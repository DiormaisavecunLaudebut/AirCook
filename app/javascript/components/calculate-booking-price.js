const start_date = document.querySelector("#start_date");
const end_date = document.querySelector("#end_date");
const kitchenPrice = document.querySelector("#new_booking");
const bookingResult = document.querySelector("#price-result");
const numberOfDays = document.getElementById("number-of-days");
const displayPrice = document.getElementById("booking-price-result");
const displayTotalPrice = document.getElementById("total-price");


const calculateBooking = () => {
  if (start_date) {
    start_date.addEventListener('change', (event) => {
    if (end_date.value !== "") {
      const startDateAsDate = new Date(start_date.value.split(' to ')[0]);
      const endDateAsDate = new Date(start_date.value.split(' to ')[1]);
      let dateInDays = ((endDateAsDate - startDateAsDate) / 86400000) + 1;
        if (dateInDays > 0) {
        } else {
          dateInDays = 1;
        }
          if (dateInDays > 1) {
            numberOfDays.innerHTML = `${dateInDays}days`;
          } else {
            numberOfDays.innerHTML = `${dateInDays}day`;
          }
      const bookingPrice = kitchenPrice.dataset.price * dateInDays;
      bookingResult.innerHTML = `${bookingPrice}€`;
      displayPrice.classList.remove("d-none");
      const totalPrice = `${bookingPrice}`;
      const totalPriceTrue = parseInt(totalPrice, 10) + 8;
      displayTotalPrice.innerHTML = `${totalPriceTrue}€`;
    }
  });

  }
}

export { calculateBooking } ;


