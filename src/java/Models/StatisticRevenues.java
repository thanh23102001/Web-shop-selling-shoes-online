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
public class StatisticRevenues {
    int unit;
    double revenue;

    public StatisticRevenues() {
    }

    public StatisticRevenues(int unit, double revenue) {
        this.unit = unit;
        this.revenue = revenue;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }
    
    
}
