package com.javaweb.utils.strategy;

import org.springframework.data.domain.Sort;

public interface SortingStrategy {
    Sort getSort();
}
