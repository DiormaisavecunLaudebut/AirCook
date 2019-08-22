import "bootstrap";
import { like } from '../components/card-like';
import "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import { calculateBooking } from '../components/calculate-booking-price';

initMapbox();
like();
calculateBooking();
