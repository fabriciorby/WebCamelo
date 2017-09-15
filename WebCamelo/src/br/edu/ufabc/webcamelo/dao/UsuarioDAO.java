package br.edu.ufabc.webcamelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.edu.ufabc.webcamelo.jdbc.ConexaoBD;
import br.edu.ufabc.webcamelo.modelo.Usuario;

public class UsuarioDAO {
		private Connection connection;
		public UsuarioDAO() {
			// cria uma conexao com o BD
			this.connection = new ConexaoBD().getConnection();
		}
		// cadastra um usuario
		public void cadastra(Usuario usuario) {
			String sql = "insert into usuarios (login, senha, nome, email, endereco, tipoUsuario, idEstado, cpf, carteira) values (?,?,?,?,?,?,?,?,?)";
			try {
				PreparedStatement stmt = connection.prepareStatement(sql);
				String senha = usuario.getSenha();
				stmt.setString(1, usuario.getLogin());
				stmt.setString(2, senha);
				stmt.setString(3, usuario.getNome());
				stmt.setString(4, usuario.getEmail());
				stmt.setString(5, usuario.getEndereco());
				stmt.setLong(6, 1);
				stmt.setLong(7, usuario.getIdEstado());
				stmt.setLong(8, usuario.getCpf());
				stmt.setDouble(9, 00.00);
				stmt.execute();
				stmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		// verifica se o usuario tem permissao de acesso
		public boolean checaPermissao(Usuario usuario) {
			boolean temPermissao = false;
			// obtem o Usuario cadastrado
			Usuario usuarioCad = getUsuario(usuario.getLogin());
				if (usuario != null && usuarioCad != null) {
					// checa se a senha inserida eh igual a senha armazenada no BD
					temPermissao = usuario.getSenha().equals(usuarioCad.getSenha());
				}
			return temPermissao;
		}
		// verifica se o usuario ja esta cadastrado no BD
		public boolean estaCadastrado(String usuario) {
			PreparedStatement stmt;
			String sql = "select * from usuarios where login = ?";
			try {
				stmt = connection.prepareStatement(sql);
				stmt.setString(1, usuario);
				ResultSet rs = stmt.executeQuery();
					if (rs.next()) {
						return true;
					}
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
			return false;
		}
			// pega um Usuario do BD
		public Usuario getUsuario(String login) {
			Usuario usuario = null;
			PreparedStatement stmt;
			String sql = "select * from usuarios where login = ?";
			try {
				stmt = connection.prepareStatement(sql);
				stmt.setString(1, login);
				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					usuario = new Usuario();
					usuario.setId(rs.getLong("id"));
					usuario.setLogin(rs.getString("login"));
					usuario.setSenha(rs.getString("senha"));
					usuario.setNome(rs.getString("nome"));
					usuario.setEmail(rs.getString("email"));
					usuario.setEndereco(rs.getString("endereco"));
					usuario.setIdEstado(rs.getLong("idEstado"));
					usuario.setCpf(Long.parseLong(rs.getString("cpf")));
					usuario.setCarteira(rs.getDouble("carteira"));
				}
			rs.close();
			stmt.close();
			} catch (SQLException e) {
			throw new RuntimeException(e);
			}
		return usuario;
		}
		
		public Usuario getUsuario(Long id) {
			Usuario usuario = null;
			PreparedStatement stmt;
			String sql = "select * from usuarios where id = ?";
			try {
				stmt = connection.prepareStatement(sql);
				stmt.setLong(1, id);
				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					usuario = new Usuario();
					usuario.setId(rs.getLong("id"));
					usuario.setLogin(rs.getString("login"));
					usuario.setSenha(rs.getString("senha"));
					usuario.setNome(rs.getString("nome"));
					usuario.setEmail(rs.getString("email"));
					usuario.setEndereco(rs.getString("endereco"));
					usuario.setIdEstado(rs.getLong("idEstado"));
					usuario.setCpf(Long.parseLong(rs.getString("cpf")));
					usuario.setCarteira(rs.getDouble("carteira"));
				}
			rs.close();
			stmt.close();
			} catch (SQLException e) {
			throw new RuntimeException(e);
			}
		return usuario;
		}
		
		public void alteraCarteira(Usuario usuario) {
			PreparedStatement stmt;
			try {
				stmt = connection.prepareStatement("update usuarios set carteira=? where login=?");
				stmt.setDouble(1, usuario.getCarteira());
				stmt.setString(2, usuario.getLogin());
				stmt.execute();
				stmt.close();
			} catch (SQLException e) {
			throw new RuntimeException(e);
			}
		}
		public void alteraPerfil(Usuario usuario) {
			PreparedStatement stmt;
			try {
				stmt = connection.prepareStatement("update usuarios set email=?, endereco=?, idEstado=? where login=?");
				stmt.setString(1, usuario.getEmail());
				stmt.setString(2, usuario.getEndereco());
				stmt.setLong(3, usuario.getIdEstado());
				stmt.setString(4, usuario.getLogin());
				stmt.execute();
				stmt.close();
			} catch (SQLException e) {
			throw new RuntimeException(e);
			}
		}
		public void alteraSenha(Usuario usuario) {
			PreparedStatement stmt;
			try {
				stmt = connection.prepareStatement("update usuarios set senha=? where login=?");
				stmt.setString(1, usuario.getSenha());
				stmt.setString(2, usuario.getLogin());
				stmt.execute();
				stmt.close();
			} catch (SQLException e) {
			throw new RuntimeException(e);
			}
		}
}
