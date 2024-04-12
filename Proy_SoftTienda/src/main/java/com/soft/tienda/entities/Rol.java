package com.soft.tienda.entities;

import jakarta.persistence.*;
import lombok.Builder;

/**
 * @author Ivan Camilo Rincon Saavedra
 * @version 1.0
 * @since 3/19/2024
 */
@Builder
@Entity
@Table(name = "roles")
public class Rol {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, length = 30)
    private String nombre;
}
