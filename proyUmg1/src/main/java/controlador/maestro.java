/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

/**
 *
 * @author macoh
 */
public class maestro {

    private int mae_codigo;
    private String mae_nombre;
    private String mae_direccion;
    private String mae_estatus;

    public maestro() {
    }

    public maestro(String mae_nombre) {
        this.mae_nombre = mae_nombre;
    }

    public int getMaecodigo() {
        return mae_codigo;
    }

    public String getMaenombre() {
        return mae_nombre;
    }

    public String getMaedireccion() {
        return mae_direccion;
    }

    public String getMaestatus() {
        return mae_estatus;
    }

    public void setMaecodigo(int maecodigo) {
        this.mae_codigo = maecodigo;
    }

    public void setMaenombre(String maenombre) {
        this.mae_nombre = maenombre;
    }

    public void setMaedireccion(String maedireccion) {
        this.mae_direccion = maedireccion;
    }

    public void setMaestatus(String maestatus) {
        this.mae_estatus = maestatus;
    }

    @Override
    public String toString() {
        return "Maestros{" + "maecodigo=" + mae_codigo + ", maenombre=" + mae_nombre + ", maedireccion=" + mae_direccion + ", maestatus=" + mae_estatus + '}';
    }
}
