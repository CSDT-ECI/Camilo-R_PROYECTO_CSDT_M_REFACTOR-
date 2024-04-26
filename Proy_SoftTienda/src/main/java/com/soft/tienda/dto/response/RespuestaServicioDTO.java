package com.soft.tienda.dto.response;

import lombok.*;

import java.util.List;

/**
 * @author Ivan Camilo Rincon Saavedra
 * @version 1.0
 * @since 4/7/2024
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RespuestaServicioDTO {
    private int status;

    private String descripcion;

    private List<Object> data;
}
