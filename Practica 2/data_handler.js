"use strict";

const products = [];

function getProduct(){
    return products;
}

function getProductById(uuid){
    if(!products.find(product => product.uuid == uuid)) return;

    let index = products.findIndex(product => product.uuid == uuid);
    return products[index];
}

function createProduct(newProduct){
    products.push(Product.createFromObject(newProduct));
}

function updateProduct(uuid, newProduct){
    if(!products.find(product => product.uuid == uuid)) return;

    let index = products.findIndex(product => product.uuid == uuid);
    Object.assign(products[index], newProduct);
}

function deleteProduct(uuid){
    if(!products.find(product => product.uuid == uuid)) return;

    let index = products.findIndex(product => product.uuid == uuid);
    products.splice(index, 1);
}