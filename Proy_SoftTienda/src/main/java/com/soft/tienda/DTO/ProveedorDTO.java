package com.soft.tienda.DTO;

public class ProveedorDTO {
	private long nitProveedor;
	private String ciudadProveedor;
	private String direccionProvedor;
	private String nombreProveedor;
	private String telefonoProveedor;

	public long getNitProveedor() {
		return nitProveedor;
	}
	public void setNitProveedor(long nitProveedor) {
		this.nitProveedor = nitProveedor;
	}
	public String getCiudadProveedor() {
		return ciudadProveedor;
	}
	public void setCiudadProveedor(String ciudadProveedor) {
		this.ciudadProveedor = ciudadProveedor;
	}
	public String getDireccionProvedor() {
		return direccionProvedor;
	}
	public void setDireccionProvedor(String direccionProvedor) {
		this.direccionProvedor = direccionProvedor;
	}
	public String getNombreProveedor() {
		return nombreProveedor;
	}
	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}
	public String getTelefonoProveedor() {
		return telefonoProveedor;
	}
	public void setTelefonoProveedor(String telefonoProveedor) {
		this.telefonoProveedor = telefonoProveedor;
	}
}
