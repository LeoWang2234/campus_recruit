package com.ecust.dao;

import com.ecust.pojo.MyCopyMessage;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * Created by cheng on 2017/8/31.
 */
public interface MyCopyDao {

    Map<String, Object> getText(@Param("userId")String userId);

    void clear();

    void setText(MyCopyMessage myCopyMessage);

}
