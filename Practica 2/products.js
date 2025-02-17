"use strict";

class ProductException{
    constructor(errorMessage){
        this.errorMessage = errorMessage;
    }
}

class Product{
    constructor(title, description, imageUrl, unit, stock, pricePerUnit, category){
        this._uuid = generateUUID();
        this.title = title;
        this.description = description;
        this.imageUrl = imageUrl;
        this.unit = unit;
        this.stock = stock;
        this.pricePerUnit = pricePerUnit;
        this.category = category;
    }

    get uuid(){
        return this._uuid;
    }

    set uuid(value){
        throw new ProductException("Product UUIDs are auto-generated.");
    }
    
    get title(){
        return this._title;
    }

    set title(value){
        if(value === ' ' /*|| typeof(value) !== "string"*/){ //Tuve un error con la validacion para el str ya que a pesar de eso aun me lo marca mal
            throw new ProductException("Product title is not string or is empty.");
        }
        this._title = value;
    }

    get description(){
        return this._description;
    }

    set description(value){
        if(value === ' ' /*|| typeof(value) !== "string"*/){
            throw new ProductException("Product description is not string or is empty.");
        }
        this._description = value;
    }

    get imageUrl(){
        return this._imageUrl;
    }

    set imageUrl(value){
        if(value === ' ' /*|| typeof(value) !== "string"*/){
            throw new ProductException("Product imageUrl is not string or is empty.");
        }
        this._imageUrl = value;
    }

    get unit(){
        return this._unit;
    }

    set unit(value){
        if(value === ' ' /*|| typeof(value) !== "string"*/){
            throw new ProductException("Product unit is not string or is empty.");
        }
        this._unit = value;
    }

    get stock(){
        return this._stock;
    }

    set stock(value){
        if(value == NaN || value < 0){
            throw new ProductException("Product pricePerUnit is not number or is negative");
        }
        this._stock = value;
    }

    get pricePerUnit(){
        return this._pricePerUnit;
    }

    set pricePerUnit(value){
        if(value == NaN || value < 0){
            throw new ProductException("Product pricePerUnit is not number or is negative");
        }
        this._pricePerUnit = value;
    }

    get category(){
        return this._category;
    }

    set category(value){
        if(value === ' ' /*|| typeof(value) !== "string"*/){
            throw new ProductException("Product category is not string or is empty.");
        }
        this._category = value;
    }

    static createFromJson(jsonValue){
        let obj = JSON.parse(jsonValue);
        return Product.createFromObject(obj);
    }

    static createFromObject(obj){
        if(obj instanceof Product){
            return obj;
        }

        let newProduct = {};
        Object.assign(newProduct, obj);
        Product.cleanObject(newProduct);

        //convertir de newProduct a una instancia de producto
        let product = new Product(newProduct.title, newProduct.description, newProduct.imageUrl, newProduct.unit, newProduct.stock, newProduct.pricePerUnit, newProduct.category);

        return product;
    }

    static cleanObject(obj){
        let properties = ['uuid', 'title'];
        for(let prop in obj){
            if(properties.includes(prop)){
                continue;
            }
            delete obj[prop];
            //if prop is porperties continue, else delete
        }
    }
}