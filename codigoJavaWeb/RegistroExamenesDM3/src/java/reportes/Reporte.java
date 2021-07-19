/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Emiliano Barat
 */
public class Reporte {
    
    private String ruta;
    private Map parameteros;
    public List datos;

    public Reporte(String ruta) {
        this.ruta = ruta;
        this.parameteros = new HashMap<>();
    }
    
    public String getRuta() {
        return ruta;
    }

    public Map getParameteros() {
        return parameteros;
    }

    public void setParameteros(Map parameteros) {
        this.parameteros = parameteros;
    }
    
    public void addParametro(String nombre, Object value){
         this.parameteros.put(nombre, value);
    }

    public List getDatos() {
        return datos;
    }

    public void setDatos(List datos) {
        this.datos = datos;
    }
    
    
    
}
