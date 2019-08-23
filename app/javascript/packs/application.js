import "bootstrap";
import "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { previewImageOnFileSelect } from '../components/photo-preview';
import { calculateBooking } from '../components/calculate-booking-price';
import { initAutocomplete } from '../plugins/init_autocomplete';

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

previewImageOnFileSelect();
initMapbox();
calculateBooking();
initAutocomplete();
