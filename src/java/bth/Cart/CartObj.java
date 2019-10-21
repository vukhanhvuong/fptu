/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bth.Cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author buith
 */
public class CartObj implements Serializable{
    private String customerId;
    private Map<String, Integer> items;

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public Map<String, Integer> getItems() {
        return items;
    }
    
    //bo do vao gio
    public void addItemToCart(String itemName) {
        //1. check cart existed
        if(this.items == null) {
            this.items = new HashMap<>();
        }
        //2. check item existed
        int quantity = 1;
        if(this.items.containsKey(itemName)) {
            quantity = this.items.get(itemName) + 1;
        }
        
        this.items.put(itemName, quantity);
    }
    
    //bo do ra khoi gio
    public void removeItemFromCart(String itemName) {
        //1. Check cart existed
        if(this.items == null) {
            return;
        }
        //2. check item
        if(this.items.containsKey(itemName)) {
            this.items.remove(itemName);
            if(this.items.isEmpty()) {
                this.items = null;
            }
        }
    }
}
