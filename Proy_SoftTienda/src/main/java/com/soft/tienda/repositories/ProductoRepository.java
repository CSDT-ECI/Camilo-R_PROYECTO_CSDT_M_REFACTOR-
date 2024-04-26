package com.soft.tienda.repositories;


import com.soft.tienda.entities.Producto;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public interface ProductoRepository extends JpaRepository<Producto, Long> {
}
