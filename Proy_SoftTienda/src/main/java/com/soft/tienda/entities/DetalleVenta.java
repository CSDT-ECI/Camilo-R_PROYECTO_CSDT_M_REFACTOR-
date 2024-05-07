package com.soft.tienda.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "DetallesVentas")
public class DetalleVenta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long codigo;

    private Integer cantidadProductos;

//	@OneToOne
//    private Producto producto;
    private Long codigoVenta;
    private Double valorTotal;
    private Double valorIva;
    private Double valorVenta;

}
