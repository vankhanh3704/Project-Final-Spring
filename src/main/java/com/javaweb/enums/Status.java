package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum Status
{
    CHUA_XU_LY("Chưa xử lý"),
    DANG_XU_LY("Đang xử lý"),
    DA_XU_LY("Đã xử lý");

    private final String statusName;

    Status(String statusName)
    {
        this.statusName = statusName;
    }

    public static Map<String, String> type()
    {
        Map<String, String> status = new TreeMap<>();
        for(Status it : Status.values())
        {
            status.put(it.toString(), it.statusName);
        }
        return status;
    }
}
