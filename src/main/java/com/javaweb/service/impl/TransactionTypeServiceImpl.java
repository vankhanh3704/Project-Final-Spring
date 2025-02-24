package com.javaweb.service.impl;

import com.javaweb.converter.TransactionTypeConverter;
import com.javaweb.entity.TransactionTypeEntity;
import com.javaweb.model.dto.TransactionTypeDTO;
import com.javaweb.repository.TransactionTypeRepository;
import com.javaweb.service.TransactionTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TransactionTypeServiceImpl implements TransactionTypeService
{
    @Autowired
    private TransactionTypeRepository transactionTypeRepository;

    @Autowired
    private TransactionTypeConverter transactionTypeConverter;

    @Override
    public List<TransactionTypeDTO> findByCodeAndCustomerId(String code, Long customerId)
    {
        List<TransactionTypeDTO> res = new ArrayList<TransactionTypeDTO>();
        List<TransactionTypeEntity> list = transactionTypeRepository.findByCodeAndCustomerId(code, customerId);
        for (TransactionTypeEntity t : list) res.add(transactionTypeConverter.toTransactionTypeDTO(t));
        return res;
    }

    @Override
    public TransactionTypeDTO addOrUpdateTransactionType(TransactionTypeDTO transactionTypeDTO)
    {
        TransactionTypeEntity transactionTypeEntity = transactionTypeConverter.toTransactionTypeEntity(transactionTypeDTO);
        transactionTypeRepository.save(transactionTypeEntity);
        return transactionTypeDTO;
    }

    @Override
    public TransactionTypeDTO findById(Long id)
    {
        return transactionTypeConverter.toTransactionTypeDTO(transactionTypeRepository.findById(id).get());
    }
}