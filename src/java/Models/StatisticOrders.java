/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author QUANG HUY
 */
public class StatisticOrders {
    int unit;
    int count;

    public StatisticOrders() {
    }

    public StatisticOrders(int unit, int count) {
        this.unit = unit;
        this.count = count;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    
}
