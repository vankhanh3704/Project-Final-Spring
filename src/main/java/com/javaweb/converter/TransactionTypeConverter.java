package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionTypeEntity;
import com.javaweb.model.dto.TransactionTypeDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionTypeRepository;
import com.javaweb.utils.NumberUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransactionTypeConverter
{
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private TransactionTypeRepository transactionTypeRepository;

    public TransactionTypeDTO toTransactionTypeDTO(TransactionTypeEntity transactionTypeEntity)
    {
        TransactionTypeDTO transactionTypeDTO = modelMapper.map(transactionTypeEntity, TransactionTypeDTO.class);
        transactionTypeDTO.setCustomerId(transactionTypeEntity.getCustomer().getId());
        if(transactionTypeEntity.getCreatedDate().equals(transactionTypeDTO.getModifiedDate()))
        {
            transactionTypeDTO.setModifiedDate(null);
            transactionTypeDTO.setModifiedBy(null);
        }
        return transactionTypeDTO;
    }

    public TransactionTypeEntity toTransactionTypeEntity(TransactionTypeDTO transactionTypeDTO)
    {
        TransactionTypeEntity transactionTypeEntity = modelMapper.map(transactionTypeDTO, TransactionTypeEntity.class);
        CustomerEntity customerEntity = customerRepository.findById(transactionTypeDTO.getCustomerId()).get();
        transactionTypeEntity.setCustomer(customerEntity);

        if(NumberUtils.checkNumber(transactionTypeDTO.getId())) //update
        {
            TransactionTypeEntity foundTransactionTypeEntity = transactionTypeRepository.findById(transactionTypeDTO.getId()).get();
            transactionTypeEntity.setCreatedBy(foundTransactionTypeEntity.getCreatedBy());
            transactionTypeEntity.setCreatedDate(foundTransactionTypeEntity.getCreatedDate());
        }
        return transactionTypeEntity;
    }
}
