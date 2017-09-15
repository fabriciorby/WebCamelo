package br.edu.ufabc.webcamelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.ufabc.webcamelo.jdbc.ConexaoBD;
import br.edu.ufabc.webcamelo.modelo.Produto;

public class ProdutoDAO {
	private Connection connection;
	public ProdutoDAO() {
		// cria uma conexao com o BD
		this.connection = new ConexaoBD().getConnection();
	}
	public void fechaConexao() {
		try {
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	// insere um produto
	public void insere(Produto produto) {
		String sql = "insert into produtos (nome, descricao, preco, estadoProduto, estadoVenda, idVendedor) values (?,?,?,?,?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, produto.getNome());
			stmt.setString(2, produto.getDescricao());
			stmt.setDouble(3, produto.getPreco());
			stmt.setLong(4, produto.getEstadoProduto());
			stmt.setLong(5, 1);
			stmt.setLong(6, produto.getIdVendedor());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	// remove um produto
	public void remove(Produto produto) {
		try {
			PreparedStatement stmt = connection.prepareStatement("delete from produtos where id=?");
			stmt.setLong(1, produto.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//pega um produto a partir do id
	public List<Produto> getProduto(Long id) {
		List<Produto> produtos = new ArrayList<Produto>();
		PreparedStatement stmt;
		String sql = "select * from produtos where id = ?";
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getLong("id"));
				produto.setNome(rs.getString("nome"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setEstadoProduto(rs.getInt("estadoProduto"));
				produto.setEstadoVenda(rs.getInt("estadoVenda"));
				produto.setIdVendedor(rs.getLong("idVendedor"));
				produtos.add(produto);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return produtos;
	}
	// devolve uma lista com todos produtos
	public List<Produto> getLista() {
		List<Produto> produtos = new ArrayList<Produto>();
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement("select * from produtos order by id");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getLong("id"));
				produto.setNome(rs.getString("nome"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setEstadoProduto(rs.getInt("estadoProduto"));
				produto.setEstadoVenda(rs.getInt("estadoVenda"));
				produto.setIdVendedor(rs.getLong("idVendedor"));
				produtos.add(produto);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return produtos;
	}
	
	public String getVendedor(int idVendedor){
		PreparedStatement stmt;
		String nome = null;
		try {
			stmt = connection.prepareStatement("select * from usuarios where id = ?");
			stmt.setLong(1, idVendedor);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				nome = rs.getString("nome");
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return nome;
	}
	
	public String getEstadoProduto(int idEstadoProduto){
		PreparedStatement stmt;
		String nome = null;
		try {
			stmt = connection.prepareStatement("select * from estadoProduto where idEstadoProduto = ?");
			stmt.setLong(1, idEstadoProduto);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				nome = rs.getString("descricao");
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return nome;
	}
}