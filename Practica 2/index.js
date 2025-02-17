"use strict";

let product = new Product("Solo Leveling", "BestSeller en corea", 
"https://kbimages1-a.akamaihd.net/ef8112fe-15c4-4d30-bc4e-91914c30afa7/1200/1200/False/solo-leveling-vol-2-comic.jpg", "pieza", 30, 300, "Libro" );
let product2 = new Product("Void Evolution System","Historia de fantasia y romance","https://img.webnovel.com/bookcover/23117951906253905/300/300.jpg?updateTime=1654626884090",
"pieza",20,200,"Libro");
let product3 = new Product("Damn Reincarnation","Historia de fantasia","https://www.wuxiaworld.com/cdn-cgi/image/fit=contain,width=384,quality=75,format=auto/https://cdn.wuxiaworld.com/images/covers/dr.jpg?ver=666e7bfebe919f9d0e8aaf68759d4b82a935fec6",
"pieza",10,180,"Libro");
let product4 = new Product("The Frozen Player Returns","Historia de fantasia","https://www.wuxiaworld.com/cdn-cgi/image/fit=contain,width=384,quality=75,format=auto/https://cdn.wuxiaworld.com/images/covers/fpr.jpg?ver=5b17aa9dc43f6baf7ed45215a1bef4353ac95cd9",
"pieza",30,250,"Libro");

createProduct(product);
createProduct(product2);
createProduct(product3);
createProduct(product4);

console.table(getProduct());
let product5 = new Product("The Beginning After The End","Historia de fantasia","https://m.media-amazon.com/images/I/51QYM9IiKWL.jpg",
"pieza",30,220,"Libro");

updateProduct(product._uuid, product5);
console.table(getProduct());
deleteProduct(product3._uuid);
console.table(getProduct());


let cart = new ShoppingCart();
cart.products = getProduct();

cart.addItem(product2._uuid, 2);
cart.addItem(product5._uuid, 1);
cart.addItem(product2._uuid, 1);

console.table(cart.productProxies);

cart.updateItem(product5._uuid, 5);
console.table(cart.productProxies);

cart.removeItem(product5._uuid);
console.table(cart.productProxies);

console.log("El total de la compra es de :" + cart.calculateTotal());


