import Typed from 'typed.js';

function loadDynamicSearchText() {
  console.log("inloaddynamic");
  if (document.querySelector('#search-typed-text')) {
    new Typed('#search-typed-text', {
      strings: ["Type a cocktail"],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicSearchText };
