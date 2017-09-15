package br.edu.ufabc.webcamelo.modelo;

public class Usuario {
private Long id;
private String login;
private String senha;
private String nome;
private String email;
private String endereco;
private int tipoUsuario;
private Long idEstado;
private Long cpf;
private Double carteira;
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getLogin() {
	return login;
}
public void setLogin(String login) {
	this.login = login;
}
public String getSenha() {
	return senha;
}
public void setSenha(String senha) {
	this.senha = senha;
}
public String getNome() {
	return nome;
}
public void setNome(String nome) {
	this.nome = nome;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getEndereco() {
	return endereco;
}
public void setEndereco(String endereco) {
	this.endereco = endereco;
}
public int getTipoUsuario() {
	return tipoUsuario;
}
public void setTipoUsuario(int tipoUsuario) {
	this.tipoUsuario = tipoUsuario;
}
public Long getIdEstado() {
	return idEstado;
}
public void setIdEstado(Long idEstado) {
	this.idEstado = idEstado;
}
public Long getCpf() {
	return cpf;
}
public void setCpf(Long cpf) {
	this.cpf = cpf;
}
public Double getCarteira() {
	return carteira;
}
public void setCarteira(Double carteira) {
	this.carteira = carteira;
}
}