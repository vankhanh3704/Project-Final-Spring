package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum TypeCode {
    TANG_TRET("Tầng trệt"),
    NGUYEN_CAN("Nguyên căn"),
    NOI_THAT("Nội thất");


    private final String name;

    TypeCode(String name) {
        this.name = name;
    }

    public String getTypeCodeName() {
        return name;
    }

    public static Map<String, String> type() {
        Map<String, String> typeCodes = new TreeMap<>();
        for (TypeCode item : TypeCode.values()) {
            typeCodes.put(item.toString(), item.name);
        }
        return typeCodes;
    }
}
