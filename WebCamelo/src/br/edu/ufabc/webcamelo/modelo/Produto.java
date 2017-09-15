package br.edu.ufabc.webcamelo.modelo;

public class Produto {
private Long id;
private String nome;
private String descricao;
private double preco;
private int estadoProduto;
private int estadoVenda;
private Long idVendedor;
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getNome() {
	return nome;
}
public void setNome(String nome) {
	this.nome = nome;
}
public String getDescricao() {
	return descricao;
}
public void setDescricao(String descricao) {
	this.descricao = descricao;
}
public double getPreco() {
	return preco;
}
public void setPreco(double preco) {
	this.preco = preco;
}
public int getEstadoProduto() {
	return estadoProduto;
}
public void setEstadoProduto(int estadoProduto) {
	this.estadoProduto = estadoProduto;
}
public int getEstadoVenda() {
	return estadoVenda;
}
public void setEstadoVenda(int estadoVenda) {
	this.estadoVenda = estadoVenda;
}
public Long getIdVendedor() {
	return idVendedor;
}
public void setIdVendedor(Long idVendedor) {
	this.idVendedor = idVendedor;
}
}