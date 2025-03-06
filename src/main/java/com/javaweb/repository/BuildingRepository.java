package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RoleEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepository extends JpaRepository<BuildingEntity,Long>, BuildingRepositoryCustom {
    BuildingEntity findById(long id);
    void deleteById(Long id);
    void deleteByIdIn(List<Long> ids);
    int countTotalItem(BuildingSearchResponse buildingSearchResponse);
//    @Modifying
//    @Query(value = "DELETE FROM assignmentbuilding WHERE buildingid = :buildingId", nativeQuery = true)
//    public void deleteAssignmentsByBuildingId(@Param("buildingId") Long buildingId);
}
