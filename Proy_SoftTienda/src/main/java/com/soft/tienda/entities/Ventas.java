package com.soft.tienda.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "ventas")
public class Ventas implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long codigo;

//    @OneToOne(fetch = FetchType.EAGER)
//    private Usuario usuario;

//    private String cedula_cliente;

    private Double totalValorVenta;

    private Double ivaVenta;
}
