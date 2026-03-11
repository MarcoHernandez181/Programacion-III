/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import controlador.maestro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 *
 * @author macoh
 */
public class maestroDao {
    private static final String SQL_SELECT = "SELECT mae_codigo, mae_nombre, mae_direccion, mae_estatus FROM maestros";
    private static final String SQL_INSERT = "INSERT INTO maestros(mae_nombre, mae_direccion, mae_estatus) VALUES(?, ?, ?)";
    private static final String SQL_UPDATE = "UPDATE maestros SET mae_nombre=?, mae_direccion=?, mae_estatus=? WHERE mae_codigo = ?";
    private static final String SQL_DELETE = "DELETE FROM maestros WHERE mae_codigo=?";
    private static final String SQL_QUERY = "SELECT mae_codigo, mae_nombre, mae_direccion, mae_estatus FROM maestros WHERE mae_codigo = ?";
    
    public List<maestro> select() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        maestro maestro = null;
        List<maestro> maestros = new ArrayList<maestro>();

        
        try {
            conn = conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int mae_codigo = rs.getInt("mae_codigo");
                String mae_nombre = rs.getString("mae_nombre");
                String mae_direccion = rs.getString("mae_direccion");
                String mae_estatus = rs.getString("mae_estatus");

                maestro = new maestro();
                maestro.setMaecodigo(mae_codigo);
                maestro.setMaenombre(mae_nombre);
                maestro.setMaedireccion(mae_direccion);
                maestro.setMaestatus(mae_estatus);

                maestros.add(maestro);
            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            conexion.close(rs);
            conexion.close(stmt);
            conexion.close(conn);
        }

        return maestros;
        
    }
    
    public int insert(maestro maestro) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = conexion.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, maestro.getMaenombre());
            stmt.setString(2, maestro.getMaedireccion());
            stmt.setString(3, maestro.getMaestatus());
            
            System.out.println("ejecutando query:" + SQL_INSERT);
            rows = stmt.executeUpdate();
            System.out.println("Registros afectados:" + rows);
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            conexion.close(stmt);
            conexion.close(conn);
        }

        return rows;
    }
    
    public int update(maestro maestro) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;

        try {
            conn = conexion.getConnection();
            System.out.println("ejecutando query: " + SQL_UPDATE);
            stmt = conn.prepareStatement(SQL_UPDATE);
            stmt.setString(1, maestro.getMaenombre());
            stmt.setString(2, maestro.getMaedireccion()); 
            stmt.setString(3, maestro.getMaestatus());  
            stmt.setInt(4, maestro.getMaecodigo());
            
            rows = stmt.executeUpdate();
            System.out.println("Registros actualizado:" + rows);

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            conexion.close(stmt);
            conexion.close(conn);
        }

        return rows;
    }
    
    public int delete(maestro maestro) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;

        try {
            conn = conexion.getConnection();
            System.out.println("Ejecutando query:" + SQL_DELETE);
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, maestro.getMaecodigo());
            rows = stmt.executeUpdate();
            System.out.println("Registros eliminados:" + rows);
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            conexion.close(stmt);
            conexion.close(conn);
        }

        return rows;
    }
        
//    public List<Persona> query(Persona empleado) { // Si se utiliza un ArrayList
    public maestro query(maestro maestro) {    
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<maestro> maestros = new ArrayList<maestro>();
        int rows = 0;

        try {
            conn = conexion.getConnection();
            System.out.println("Ejecutando query:" + SQL_QUERY);
            stmt = conn.prepareStatement(SQL_QUERY);
            stmt.setInt(1, maestro.getMaecodigo());
            rs = stmt.executeQuery();
            while (rs.next()) {
                int mae_codigo = rs.getInt("mae_codigo");
                String mae_nombre = rs.getString("mae_nombre");
                String mae_direccion = rs.getString("mae_direccion");
                String mae_estatus = rs.getString("mae_estatus");

                maestro = new maestro();
                maestro.setMaecodigo(mae_codigo);
                maestro.setMaenombre(mae_nombre);
                maestro.setMaedireccion(mae_direccion);
                maestro.setMaestatus(mae_estatus);

                maestros.add(maestro);
                
                //empleados.add(empleado); // Si se utiliza un ArrayList
            }
            System.out.println("Registros buscado:" + maestro);
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            conexion.close(rs);
            conexion.close(stmt);
            conexion.close(conn);
        }

        //return empleados;  // Si se utiliza un ArrayList
        return maestro;
    }    
        
}
