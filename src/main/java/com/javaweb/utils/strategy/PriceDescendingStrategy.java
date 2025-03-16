package com.javaweb.utils.strategy;

import org.springframework.data.domain.Sort;

public class PriceDescendingStrategy implements SortingStrategy {
    @Override
    public Sort getSort() {
        return Sort.by(Sort.Direction.DESC, "rentPrice");
    }
}
