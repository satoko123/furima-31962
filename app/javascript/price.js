function price() {
  const price_input = document.getElementById("item-price");
  price_input.addEventListener("input", () => {
    const value_input = price_input.value;
    const add_tax_dom = document.getElementById("add-tax-price");
    const add_profit_dom = document.getElementById("profit");
    add_tax_dom.innerHTML = Math.floor(value_input * 0.1);
    add_profit_dom.innerHTML = Math.floor(value_input - add_tax_dom.innerHTML);
  })
} 
window.addEventListener('load', price)