package com.soft.tienda.repositories;

import com.soft.tienda.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<Usuario, Long> {
    @Query("SELECT U FROM Usuario U WHERE U.correo=?1")
    Usuario obtenerUsuarioPorCorreo(String correo);
}
