package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.utils.NumberUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom
{
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public int countTotalItem(CustomerSearchResponse customerSearchResponse) {
        String sql = buildQueryFilter(customerSearchResponse.getId());
        Query query = entityManager.createNativeQuery(sql);
        return query.getResultList().size();
    }

    private String buildQueryFilter(Long id) {
        String sql = "SELECT * FROM customer b where b.id = " + id;
        return sql;
    }

    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable)
    {
        StringBuilder sql = new StringBuilder("Select * from customer b ") ;
        StringBuilder where = new StringBuilder(" where 1 = 1 ");

        joinExecute(customerSearchRequest, sql);
        queryNormal(customerSearchRequest, where);
        querySpecial(customerSearchRequest, where);
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    // join table
    public static void joinExecute(CustomerSearchRequest customerSearchRequest, StringBuilder sql)
    {
        Long staffId = customerSearchRequest.getStaffId();
        if(NumberUtils.checkNumber(staffId)) sql.append(" join assignmentcustomer on assignmentcustomer.customerid = b.id ");
    }

    public static void querySpecial(CustomerSearchRequest customerSearchRequest, StringBuilder where)
    {
        Long staffId = customerSearchRequest.getStaffId();
        if(NumberUtils.checkNumber(staffId)) where.append(" and assignmentCustomer.staffId = " + staffId + " ");
        where.append(" and b.is_active = 1 ");
    }

    public static void queryNormal(CustomerSearchRequest customerSearchRequest, StringBuilder where)
    {
        try
        {
            Field[] fields = CustomerSearchRequest.class.getDeclaredFields();

            for(Field item : fields)
            {
                item.setAccessible(true);
                String fieldName = item.getName();

                if(!fieldName.equals("staffId"))
                {
                    Object value = item.get(customerSearchRequest);

                    if(value != null && !value.equals(""))
                    {
                        where.append(" and b." + fieldName + " like '%" + value + "%' ");
                    }
                }
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }
}
