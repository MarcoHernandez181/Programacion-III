/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package domain;

/**
 *
 * @author macoh
 */
public class empresa {
    
      
    int codigoEmpresa;    //atributos privados
    String nombreEmpresa;
    
    //constructores
    
    public empresa(int codigo, String nombre){
        codigoEmpresa = codigo;
        nombreEmpresa = nombre;
    }
    
    public int getCodigoEmpresa(){
        return codigoEmpresa;
    }
    
    public void setCodigoEmpresa(int codigo){
        codigoEmpresa=codigo;
    }
    
        @Override
    public String toString(){
        return " codigo" + codigoEmpresa + " nombre" + nombreEmpresa;
    
    
    
    
}
}