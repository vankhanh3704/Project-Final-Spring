package com.javaweb.utils.strategy;

import org.springframework.data.domain.Sort;

public class AreaAscendingStrategy implements SortingStrategy {

    @Override
    public Sort getSort() {
        return Sort.by(Sort.Direction.ASC, "floorArea");
    }
}
