package com.javaweb.utils.strategy;

import org.springframework.data.domain.Sort;

import java.util.HashMap;
import java.util.Map;

public class SortingStrategyFactory {
    private static final Map<String, SortingStrategy> strategies = new HashMap<>();

    static {
        strategies.put("thap-cao", new PriceAscendingStrategy());
        strategies.put("cao-thap", new PriceDescendingStrategy());
        strategies.put("dien-tich-tang", new AreaAscendingStrategy());
        strategies.put("dien-tich-giam", new AreaDescendingStrategy());
    }

    public static SortingStrategy getStrategy(String sort) {
        return strategies.getOrDefault(sort, () -> Sort.unsorted());
    }
}