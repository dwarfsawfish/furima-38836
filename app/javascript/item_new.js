window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price")
  addEventListener('change', () => {
    const num = itemPrice.value;

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(num * 0.1);

    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(num - (num * 0.1));
    
  });
});