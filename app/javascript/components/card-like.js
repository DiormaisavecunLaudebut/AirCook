const cards = document.querySelectorAll('.card-link')

const like = () => {
  cards.forEach((card) => {
    card.addEventListener('mouseover', (event) => {
      event.currentTarget.parentElement.insertAdjacentHTML('beforeend', `<i class="fa fa-heart"></i>`)
    });
  });
};

const dislike = () => {
  cards.forEach((card) => {
    card.addEventListener('mouseleave', (event) => {
      event.currentTarget.nextSibling.nextSibling.remove();
      // event.currentTarget.parentElement.insertAdjacentHTML('beforeend', `<i class="far fa-heart"></i>`)
    });
  });
};

export { dislike, like };
