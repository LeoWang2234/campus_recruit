package com.ecust.service;

import java.util.Map;

public interface ChartsService {

	Map<String, Object> queryTypeChart();

	Map<String, Object> queryStateChart();

	Map<String, Object> queryRepairChart(String time);

}
