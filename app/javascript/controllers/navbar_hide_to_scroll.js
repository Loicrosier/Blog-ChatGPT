const navHideToScroll = () => {
  const navbar = document.querySelector('.navbar');

  let lastScrollPosition = 0;
  window.addEventListener("scroll", () => {
    const currentScrollPosition = window.pageYOffset || document.documentElement.scrollTop;
    if (lastScrollPosition === 1) {
      navbar.style.opacity = '0.8';
    } else if (lastScrollPosition >= 11 && lastScrollPosition <= 18) {
      navbar.style.opacity = '0.6';
    } else if (lastScrollPosition >= 18 && lastScrollPosition <= 26) {
      navbar.style.opacity = '0.4';
    } else if (lastScrollPosition >= 26 && lastScrollPosition <= 33) {
      navbar.style.opacity = '0.2';
    } else if (lastScrollPosition >= 33) {
      navbar.style.opacity = '0';
    } else if (lastScrollPosition >= 0 && lastScrollPosition <= 18) {
      navbar.style.opacity = '1';
    }
    lastScrollPosition = parseInt(currentScrollPosition);
  });


}

export { navHideToScroll }
