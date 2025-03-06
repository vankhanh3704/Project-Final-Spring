package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private BuildingRepository buildingRepository;



//    public static void joinTable(BuildingSearchRequest buildingSearchRequest,StringBuilder sql){
//        Long staffId=buildingSearchRequest.getStaffId();
//        if(staffId!=null){
//            sql.append(" inner join assignmentbuilding on building.id=assignmentbuilding.buildingid ");
//        }
//
//    }
    public static void queryNomal(BuildingSearchRequest buildingSearchRequest,StringBuilder where){
        try{
            Field[] fields=BuildingSearchRequest.class.getDeclaredFields();
            for(Field item:fields){
                item.setAccessible(true);
                String fieldName=item.getName();
                if(!fieldName.equals("staffId") && !fieldName.equals("typeCode") &&! fieldName.startsWith("area") && !fieldName.startsWith("rentPrice")){
                    Object value=item.get(buildingSearchRequest);
                    if(value !=null && !value.equals("")){
                        if(item.getType().getName().equals("java.lang.Long") ||item.getType().getName().equals("java.lang.Integer")
                                || item.getType().getName().equals("java.lang.Float")){

                            where.append(" and building."+fieldName+" = "+value);
                        } else if(item.getType().getName().equals("java.lang.String")){
                            where.append(" and building."+ fieldName+" like '%"+value+"%' ");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void querySpecial(BuildingSearchRequest buildingSearchRequest,StringBuilder where){
        Long staffId= buildingSearchRequest.getStaffId();
        if(staffId!=null) {
            where.append(" and exists (select * from assignmentbuilding where assignmentbuilding.buildingid = building.id and assignmentbuilding.staffid="+staffId+") ");
        }
        Long rentAreaFrom=buildingSearchRequest.getAreaFrom();
        Long rentAreaTo=buildingSearchRequest.getAreaTo();
        if(rentAreaFrom !=null || rentAreaTo!=null) {
            where.append(" and exists (select * from rentarea where rentarea.buildingid = building.id ");
            if(rentAreaFrom !=null) {
                where.append(" and rentarea.value >= "+ rentAreaFrom);
            }
            if(rentAreaTo !=null) {
                where.append(" and rentarea.value <= "+ rentAreaTo);
            }
            where.append(")");
        }
        Long rentPriceFrom=buildingSearchRequest.getRentPriceFrom();
        Long rentPriceTo=buildingSearchRequest.getRentPriceTo();
        if(rentPriceFrom !=null || rentPriceTo !=null) {
            if(rentPriceFrom !=null	) {
                where.append("  and building.rentprice >= "+ rentPriceFrom);
            }
            if(rentPriceTo !=null) {
                where.append(" and building.rentprice <= "+ rentPriceTo);
            }

        }
        List<String> typeCode= buildingSearchRequest.getTypeCode();
        if(typeCode!=null && typeCode.size()>0) {
            where.append(" and(");
            String sql =typeCode.stream().map(it -> " building.type like '%"+ TypeCode.valueOf(it) +"%'").collect(Collectors.joining(" OR "));
            where.append(sql);
            where.append(")");
        }

    }


    @Override
    public List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder(" select * from building ");
        StringBuilder where= new StringBuilder(" where 1=1 ");
//        joinTable(buildingSearchRequest,sql);
        queryNomal(buildingSearchRequest,where);
        querySpecial(buildingSearchRequest,where);
        sql.append(where);
        sql.append(" group by building.id;");
        Query query=entityManager.createNativeQuery(sql.toString(),BuildingEntity.class);
        return query.getResultList();
    }


    @Override
    public int countTotalItem(BuildingSearchResponse buildingSearchResponse)
    {
        String sql = buildQueryFilter(buildingSearchResponse.getId());
        Query query = entityManager.createNativeQuery(sql);
        return query.getResultList().size();
    }
    private String buildQueryFilter(Long id) {
        String sql = "SELECT * FROM building b where b.id = " + id;
        return sql;
    }
}
