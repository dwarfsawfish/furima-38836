const item = () => {
  const itemPrice = document.getElementById("item-price")
  addEventListener('change', () => {
    if (itemPrice){

      const num = itemPrice.value;

      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = Math.floor(num * 0.1);
  
      const profit = document.getElementById("profit");
      profit.innerHTML = Math.floor(num - (num * 0.1));
      
    };
  });
};

window.addEventListener('load', item);