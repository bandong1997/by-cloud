package com.by.lesson.coor.encap;

/**
 * @author bandd
 * @date2025年12月19日16:42
 */
public class CRSConstants {

    // ==================== 地理坐标系 ====================

    // 35带中央经线 = 35*3 - 105 = 105°
    public static String CGCS2000_35N = "+proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=35500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
    // 35带中央经线 = 35*3 - 105 = 105°
    private static final String CGCS2000_35 = "+proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
    // 36带中央经线 = 36*3 - 105 = 108°
    public static String CGCS2000_36N = "+proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=36500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
    // 36带中央经线 = 36*3 - 105 = 108°
    private static final String CGCS2000_36 = "+proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";
    // 目标CRS
    public static String MB = "+proj=longlat +ellps=GRS80 +no_defs";


}
