const hearts = document.querySelectorAll('.fa-heart')

const like = () => {
  hearts.forEach((heart) => {
    heart.addEventListener('click', (event) => {
      event.currentTarget.classList.toggle('fa');
      event.currentTarget.classList.toggle('far');
    });
  });
};

export { like };
