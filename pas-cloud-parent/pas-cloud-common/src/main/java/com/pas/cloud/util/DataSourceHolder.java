package com.pas.cloud.util;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:00:28
 */
public class DataSourceHolder {

	//线程本地环境
    private static final ThreadLocal<String> dataSources = new ThreadLocal<String>();
    //设置数据源
    public static void setDataSource(String customerType) {
        dataSources.set(customerType);
    }
    //获取数据源
    public static String getDataSource() {
        return (String) dataSources.get();
    }
    //清除数据源
    public static void clearDataSource() {
        dataSources.remove();
    }
}
