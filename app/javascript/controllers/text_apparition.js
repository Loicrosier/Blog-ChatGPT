import Typed from 'typed.js';

const textApparition = () => {
  console.log(document.getElementById('blog-name'));
  if (document.getElementById('blog-name')) {
    const typed = new Typed('#blog-name', {
      strings: ["LifeTechExplorer", "TechNewStyles", "MoneyHealthLaw", "WorldTrendsCentral", "HealthyHabitat"],
      typeSpeed: 50,
      backSpeed: 50,
      loop: true
    });
  }

}

export { textApparition }
