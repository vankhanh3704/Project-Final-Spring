package com.javaweb.service;

import com.javaweb.model.dto.TransactionTypeDTO;

import java.util.List;

public interface TransactionTypeService
{
    List<TransactionTypeDTO> findByCodeAndCustomerId(String code, Long customerId);
    TransactionTypeDTO addOrUpdateTransactionType(TransactionTypeDTO transactionTypeDTO);
    TransactionTypeDTO findById(Long id);
}
