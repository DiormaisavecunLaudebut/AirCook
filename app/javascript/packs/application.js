import "bootstrap";
import { like, dislike } from '../components/card-like';
import "../plugins/flatpickr"
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

like();
dislike();
initMapbox();

