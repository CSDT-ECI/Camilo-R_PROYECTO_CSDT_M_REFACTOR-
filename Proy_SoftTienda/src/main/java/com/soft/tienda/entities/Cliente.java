package com.soft.tienda.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;

/**
 * @author Ivan Camilo Rincon Saavedra
 * @version 1.0
 * @since 3/24/2024
 */
@Data
@Entity
@Table(name = "clientes")
public class Cliente {
    private String direccion;

    private String telefono;
}
