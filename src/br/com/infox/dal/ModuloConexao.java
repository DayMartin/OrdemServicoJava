/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.infox.dal;

import java.sql.*;

/**
 *
 * @author dinahdoria
 */
public class ModuloConexao {
    // método responsavel por estabelecer a conexão com o banco
    public static Connection conector() {
        java.sql.Connection conexao = null;
        // chamar o driver importado mysql connector
        String driver = "com.mysql.cj.jdbc.Driver";
        // Armazenando informações referente ao banco 
        String url ="jdbc:mysql://localhost:3306/dbinfox";
        String user="root";
        String password = "giovana0407";
        // Estabelecer a conexão com o banco
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (Exception e) {
            // linha para esclarecer o erro
            //System.out.println(e);
            return null;
        }
        
    }
    
}
