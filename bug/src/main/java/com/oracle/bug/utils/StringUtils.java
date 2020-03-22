package com.oracle.bug.utils;

import java.util.List;
import java.util.Map;

/**
 * Created by zgw25 on 2017/1/5.
 */
public class StringUtils {
    public static Boolean isNullOrNot(Object...objects){
        boolean flag = false;
        for (int i = 0; i <objects.length ; i++) {
            if (objects[i] == null){
                flag = true;
            }
            if (objects[i] instanceof String && ((String)objects[i]).trim().isEmpty()){
                flag = true;
            }
            if (objects[i] instanceof Map && ((Map)objects[i]).size() ==0){
                flag = true;
            }
            if (objects[i] instanceof List && ((List)objects[i]).size() == 0){
                flag = true;
            }
        }
        return flag;
    }
}
