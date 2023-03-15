const addPaddingScroll = () => {

  const divScroll = document.querySelector('.questions');
  console.log(divScroll);

  if (divScroll) {
    // listen scroll
    divScroll.addEventListener('scroll', (() => {
      // boolean check if scroll down
      const isAtBottom = divScroll.scrollHeight - divScroll.scrollTop === divScroll.clientHeight;
      console.log(isAtBottom);

      if (isAtBottom) {
        divScroll.style.paddingTop = '55px'
      } else {
        divScroll.style.paddingTop = '20px'
      }
    }));
  }

}

export { addPaddingScroll }
