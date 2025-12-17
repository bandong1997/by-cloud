package com.by.devtool.coor.encap;

/**
 * @author bandd
 * @date2025年12月17日10:20
 */
import org.locationtech.proj4j.*;

public class CGCS2000Transformer {

    // 35带中央经线 = 35*3 - 105 = 105°
    private static final String CGCS2000_35N = "+proj=tmerc +lat_0=0 +lon_0=105 +k=1 +x_0=35500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";

    // 36带中央经线 = 36*3 - 105 = 108°
    private static final String CGCS2000_36N = "+proj=tmerc +lat_0=0 +lon_0=108 +k=1 +x_0=36500000 +y_0=0 +ellps=GRS80 +units=m +no_defs";

    // 目标
    private static final String mb = "+proj=longlat +ellps=GRS80 +no_defs";

    private static CRSFactory crsFactory = new CRSFactory();
    private CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();

    /**
     * CGCS2000 35带投影坐标转地理坐标
     * @param y 北坐标（正常值，如：2948492.000）
     * @param x 东坐标（带带号，如：35620127.000）
     * @return [经度, 纬度]
     */
    public double[] transform35NToGeographic(double y, double x) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("CGCS2000_35N", CGCS2000_35N);
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("EPSG:4490",mb);

            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            // 去掉35带号：35620127 -> 620127，源中已处理了就不需要再此处理   35500000
            // double easting = x - 35000000;
            double easting = x;;

            ProjCoordinate srcCoord = new ProjCoordinate(easting, y);
            ProjCoordinate tgtCoord = new ProjCoordinate();

            transform.transform(srcCoord, tgtCoord);

            return new double[]{tgtCoord.x, tgtCoord.y};

        } catch (Exception e) {
            throw new RuntimeException("35带坐标转换失败", e);
        }
    }

    /**
     * CGCS2000 36带投影坐标转地理坐标
     * @param y 北坐标（正常值，如：2948492.000）
     * @param x 东坐标（带带号，如：36620127.000）
     * @return [经度, 纬度]
     */
    public double[] transform36NToGeographic(double y, double x) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("EPSG:CGCS2000_36N", CGCS2000_36N);
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("EPSG:4490",mb);
            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            // 去掉36带号：36620127 -> 620127，源中已处理了就不需要再此处理
            // double easting = x - 36000000;
            double easting = x;
            ProjCoordinate srcCoord = new ProjCoordinate(easting, y);
            ProjCoordinate tgtCoord = new ProjCoordinate();

            transform.transform(srcCoord, tgtCoord);

            return new double[]{tgtCoord.x, tgtCoord.y};

        } catch (Exception e) {
            throw new RuntimeException("36带坐标转换失败", e);
        }
    }

    /**
     * 自动判断带号并进行转换（通用方法）
     * @param y 北坐标
     * @param x 带带号的东坐标
     * @return [经度, 纬度]
     */
    public double[] transformToGeographic(double y, double x) {
        // 提取带号（前2位）
        int zone = (int) (x / 1000000);

        if (zone == 35) {
            return transform35NToGeographic(y, x);
        } else if (zone == 36) {
            return transform36NToGeographic(y, x);
        } else {
            throw new IllegalArgumentException("不支持的带号：" + zone + "，仅支持35带和36带");
        }
    }

    /**
     * 地理坐标转35带投影坐标
     * @param lon 经度
     * @param lat 纬度
     * @return [北坐标, 带带号的东坐标]
     */
    public double[] transformGeographicTo35N(double lon, double lat) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("WGS84", mb);
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("CGCS2000_35N", CGCS2000_35N);

            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            ProjCoordinate srcCoord = new ProjCoordinate(lon, lat);
            ProjCoordinate tgtCoord = new ProjCoordinate();

            transform.transform(srcCoord, tgtCoord);

            // 添加带号：620127 -> 35620127
            double easting = tgtCoord.x;

            return new double[]{tgtCoord.y, easting};

        } catch (Exception e) {
            throw new RuntimeException("地理坐标转35带投影坐标失败", e);
        }
    }

    /**
     * 地理坐标转36带投影坐标
     * @param lon 经度
     * @param lat 纬度
     * @return [北坐标, 带带号的东坐标]
     */
    public double[] transformGeographicTo36N(double lon, double lat) {
        try {
            CoordinateReferenceSystem sourceCRS = crsFactory.createFromParameters("WGS84",
                    "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs");
            CoordinateReferenceSystem targetCRS = crsFactory.createFromParameters("CGCS2000_36N", CGCS2000_36N);

            CoordinateTransform transform = ctFactory.createTransform(sourceCRS, targetCRS);

            ProjCoordinate srcCoord = new ProjCoordinate(lon, lat);
            ProjCoordinate tgtCoord = new ProjCoordinate();

            transform.transform(srcCoord, tgtCoord);

            // 添加带号：620127 -> 36620127
            double easting = tgtCoord.x + 36000000;

            return new double[]{tgtCoord.y, easting};

        } catch (Exception e) {
            throw new RuntimeException("地理坐标转36带投影坐标失败", e);
        }
    }
}