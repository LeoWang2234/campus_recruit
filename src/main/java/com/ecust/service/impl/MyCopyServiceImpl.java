package com.ecust.service.impl;

import com.ecust.dao.MyCopyDao;
import com.ecust.pojo.MyCopyMessage;
import com.ecust.service.MyCopyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by cheng on 2017/8/31.
 */
@Service
public class MyCopyServiceImpl implements MyCopyService {


    @Autowired
    private MyCopyDao myCopyDao;

    @Override
    public Map<String, Object> getText(String userId) {
        return myCopyDao.getText(userId);
    }

    @Override
    public void clear() {
        myCopyDao.clear();
    }

    @Override
    public void setText(MyCopyMessage myCopyMessage) {
        myCopyDao.setText(myCopyMessage);
    }

}
