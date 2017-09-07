package com.ecust.service;

import com.ecust.pojo.MyCopyMessage;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * Created by cheng on 2017/8/31.
 */
public interface MyCopyService {

    Map<String, Object> getText(String userId);

    void clear();

    void setText(MyCopyMessage myCopyMessage);

}
