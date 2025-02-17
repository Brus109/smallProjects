"use strict";

class shoppingCartException{
    constructor(errorMessage){
        this.errorMessage = errorMessage;
    }
}

class ProductProxy{
    constructor(productUuid, amount){
        this.productUuid = productUuid;
        this.amount = amount;
    }
}

class ShoppingCart{
    constructor(){
        this.products = [];
        this.productProxies = [];
    }

    get products(){
        return this._products();
    }

    set products(value){
        this._products = [];
        //if type String -- parse JSON
        if(value == 'string'){
            let obj = JSON.parse(value);
            this._products.push(Product.createFromObject(obj));
        }else if(Array.isArray(value)){
            for(let pro of value){
                this._products.push(Product.createFromObject(pro));
            }
        }else{
            this._products.push(Product.createFromObject(value));
        }
        //if array -- for and create
        //if single element -- create
       
    }

    addItem(productUuid, amount){
        if(amount == 0) return;
        if(amount < 0) throw new shoppingCartException("un mensaje");

        // find -- update existing or create new
        if(this.productProxies.find(user => user.productUuid == productUuid)){
            let index = this.productProxies.findIndex(user => user.productUuid == productUuid);
            this.productProxies[index].amount += amount;
        }else{
            let box = new ProductProxy(productUuid, amount);
            this.productProxies.push(box);
        }
    }

    updateItem(productUuid, newAmount){
        if(newAmount == 0) return;
        if(newAmount < 0) throw new shoppingCartException("un mensaje");

        //find -- update existing or throw error if not
        if(this.productProxies.find(user => user.productUuid == productUuid)){
            let index = this.productProxies.findIndex(user => user.productUuid == productUuid);
            this.productProxies[index].amount = newAmount;
        }else{
            throw new shoppingCartException("Error");
        }
    }

    removeItem(productUuid){
        //find -- remove existing or throw error if not
        //use splice to remove
        if(this.productProxies.find(user => user.productUuid == productUuid)){
            let index = this.productProxies.findIndex(user => user.productUuid == productUuid);
            this.productProxies.splice(index, 1);
        }else{
            throw new shoppingCartException("Error");
        }
    }

    calculateTotal(){
        let total = 0;
        //for products / proxies -- total += product.price * proxy amount
        for(let pro of this._products){
            for(let prox of this.productProxies){
                if(pro.uuid == prox.productUuid){
                    total += pro.pricePerUnit * prox.amount;
                }
            }
        }
        return total;
    }
}