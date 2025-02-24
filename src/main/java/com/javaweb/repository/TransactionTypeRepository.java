package com.javaweb.repository;

import com.javaweb.entity.TransactionTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TransactionTypeRepository extends JpaRepository<TransactionTypeEntity, Long>
{
    List<TransactionTypeEntity> findByCodeAndCustomerId(String code, Long customerId);
}
