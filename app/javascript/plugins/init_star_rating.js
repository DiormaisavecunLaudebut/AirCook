import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars.css";
import $ from 'jquery';

const initStarRating = () => {
  $('#review_precision').barrating({
    theme: 'css-stars'
  });
  $('#review_communication').barrating({
    theme: 'css-stars'
  });
  $('#review_cleanliness').barrating({
    theme: 'css-stars'
  });
  $('#review_quality').barrating({
    theme: 'css-stars'
  });
  $('#review_location').barrating({
    theme: 'css-stars'
  });
  $('#review_equipments').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
